import java.lang.Math;
import controlP5.*;
//PGraphics l2;
int mit = 50;
double xoff = 0;
double yoff = 0;
double[][] buffer = new double[5][2];
double xrange = -2;
double xRange = 1;
double yrange = -1.5;
double yRange = 1.5;
double xspan;
double yspan;
boolean cline= false;
long zoom = 1;


PGraphics ima;
void setup() {
  size(1000, 1000,P3D);
 ima= createGraphics(1000,1000);
  Second se = new Second();
  String[] args = {"Second"};
  PApplet.runSketch(args,se);
     
   Third tr = new Third();
  String[] args2 = {"Third"};
  PApplet.runSketch(args,tr);
  /*
l2 = createGraphics(1000,1000);
l2.beginDraw();

l2.stroke(255,0,0);
l2.strokeWeight(2);

l2.line(mouseX,0,mouseX,height);
l2.line(0,mouseY,width,mouseY);

l2.endDraw();*/
redrawf();
}

void draw() {
 /* l2.beginDraw();
 l2.stroke(255,0,0);
l2.strokeWeight(2);

l2.line(mouseX,0,mouseX,height);
l2.line(0,mouseY,width,mouseY);

l2.endDraw();
 image(l2,0,0);
 */
 background(0);
image(ima,0,0);   
graphMouseDistances();

if(cline){
  spiral(5);
}
}


int gc(int x, int y) {
  // Pick a constant C for the Julia set
  double cx = map(mouseX,0,width,-2,1);
  double cy = map(mouseY,0,height,-1.5,1.5);

  // Map pixel coordinates to the complex plane
  double tx = mapValue(x, 0, width, xrange/zoom+xoff, xRange/zoom+xoff);
  double ty = mapValue(y, 0, height, yrange/zoom+yoff, yRange/zoom+yoff);

  double r = tx;
  double i = ty;

  int counter = 0;
  double tmp = 0;

  while (r * r + i * i < 4 && ++counter < mit ) {
    if(bc(i,r)){return 0;}
       atb(i,r);
    tmp = r*r - i*i + tx;
    i = 2*r*i + ty;
    r = tmp;
    if (Math.sqrt(r*r + i*i) > 4) {
      break;
    }
  }
  if (counter == mit) {
    return 0;
  }
  return (int)mapValue(counter, 0, mit, 0, 255);
}


double mapValue(double X, double X_min, double X_max, double Y_min, double Y_max) {
  return ((X - X_min) / (X_max - X_min)) * (Y_max - Y_min) + Y_min;
}

void mouseWheel(MouseEvent event) {
  if(event.getCount() > 0){
  zoom*=10;
  }else{
    zoom/=10;
    if(zoom == 0){
      zoom =1 ;
    }
  }
 
  println(zoom);
  redrawf();
}


void redrawf(){
ima.beginDraw();  
  
ima.loadPixels();
  for (int i = 0; i<width; i++) {
    for (int j =0; j < height; j++) {
      ima.pixels[i*width+j] = color(gc(j, i));
    }
  }
  ima.updatePixels();
ima.endDraw();  
}


float[] graphMouseDistances(){

  double tx = mapValue(mouseX, 0, width, xrange/zoom+xoff, xRange/zoom+xoff);
  double ty = mapValue(mouseY, 0, height, yrange/zoom+yoff, yRange/zoom+yoff);

  double r = 0;
  double i = 0;

  int counter = 0;
  double tmp = 0;

  float[] data = new float[mit];
  do{
    tmp = r*r -i*i +tx;
    i = 2*r*i+ty;
    r = tmp;
    
    data[counter] = (float)Math.sqrt(r*r+i*i);  
  }  while (++counter < mit);



  return data;
  }
  
  
  float gmx(){
 return (float)mapValue(mouseX, 0, width, xrange/zoom+xoff, xRange/zoom+xoff);
    
    
  }
  float gmy(){
return  (float)mapValue(mouseY, 0, height, yrange/zoom+yoff, yRange/zoom+yoff);
    
  }
  
  
  void spiral(int x ){
double tx = mapValue(mouseX, 0, width, xrange / zoom + xoff, xRange / zoom + xoff);
double ty = mapValue(mouseY, 0, height, yrange / zoom + yoff, yRange / zoom + yoff);

double r = 0;
double i = 0;

double tmp = 0;
float px = mouseX, py = mouseY;

for (int ic = 1; ic <= x; ic++) {
    tmp = r * r - i * i + tx;
    i = 2 * r * i + ty;
    r = tmp;

    float ux = (float) mapValue(r, xrange / zoom + xoff, xRange / zoom + xoff, 0, width) ;
    float uy = (float) mapValue(i, yrange / zoom + yoff, yRange / zoom + yoff, 0, height);

    if (ic == x) {
        fill(255, 0, 0);
        line(ux, uy, px, py);
        stroke(0, 255, 0);
        line(mouseX, mouseY, ux, uy);
        noStroke();
        ellipse(ux, uy, 10, 10);
    } else {
        fill(255);
        stroke(255);
        ellipse(ux, uy, 5, 5);
        line(px, py, ux, uy);  // Corrected line drawing order
        px = ux;
        py = uy;
    }
}

 }
  
  void atb(double x, double y){
  for(int i =0; i < buffer.length-2; i++){
    buffer[i][0] = buffer[i+1][0];
    buffer[i][1] = buffer[i+1][1];
  }

buffer[buffer.length-1][0] = x;
buffer[buffer.length-1][1] = y;
  
}
  boolean bc(double x, double y){
  

for(int i =0; i < buffer.length; i++){
  if(x == buffer[i][0] && y == buffer[i][1]){
 
    return true;
  }
}return false;
}
void wb(){
  for(int i=0; i< buffer.length-1; i++){
    buffer[i][0] = -1;
    buffer[i][1] = -1;
  }
}
  
  
