public class Third extends PApplet{
  public void settings(){
    size(500,500);
  }
  public void draw(){
    this.loadPixels();
  for (int i = 0; i<width; i++) {
    for (int j =0; j < height; j++) {
      this.pixels[i*width+j] = color(gcc(j, i));
    }
  }
  this.updatePixels();
  
  float umapx = map((float)(xrange/zoom+xoff),-2,1,0,500);
  float umapX = map((float)(xRange/zoom+xoff),-2,1,0,500);
  float umapy = map((float)(yrange/zoom+yoff),-1.5,1.5,0,500);
  float umapY = map((float)(yRange/zoom+yoff),-1.5,1.5,0,500);
  
    this.strokeWeight(2);
    stroke(255,0,0);
    noFill();
    rect(umapx,umapy,umapX-umapx,umapY-umapy);
    spiral2();
  }
  
  int gcc(int x, int y) {

  double tx = mapValue(x, 0, width, xrange, xRange);
  double ty = mapValue(y, 0, height, yrange, yRange);

  double r = 0;
  double i =0;

  int counter = 0;
  double tmp = 0;

  while (r * r + i * i < 4 && ++counter < 50 ) {
    tmp = r*r -i*i +tx;
    i = 2*r*i+ty;
    r = tmp;
    if(Math.sqrt(r*r-i*i) > 4){break;}
  }
  if (counter == 50)return 0;
  return (int)mapValue(counter, 0, mit, 0, 255);
}

  void spiral2(){

 double tx = gmx();
  double ty = gmy();
  
  double r = 0;
  double i =0;

  double tmp = 0;
  float px = 0,py=0;
 for(int ic =1; ic <= 5; ic++){
   

    tmp = r*r -i*i +tx;
    i = 2*r*i+ty;
    r = tmp;
    if(Math.sqrt(r*r-i*i) > 4){break;}

    
    float ux = (float)mapValue(r,-2,1,0,width);
    
    float uy = (float)mapValue(i,-1.5,1.5,0,height);
    fill(255);
    stroke(255);
       ellipse(ux,uy,5,5);
       if(ic == 1){
         px = ux;
         py = uy;
       }
     line(ux,uy,px,py);
     px = ux;
     py = uy;
  
 }
 

  
  
  
  
  
}

}
