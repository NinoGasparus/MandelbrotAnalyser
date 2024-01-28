public class Second extends PApplet{
  public void settings(){

    size(1000,700);
  }
  public void draw(){
    background(0);
    strokeWeight(2);
    translate(0,-50);
    float[] data = graphMouseDistances();
    float px = 0; float py = this.height-0;
    for(int i =0; i<data.length; i++){
      float x = map(i,0,data.length,0,this.width);
      float y = this.height-data[i]*50;
      stroke(random(0,360),random(0,360),random(0,360));
      line(x,y,px,py);
      px = x;
      py = y;
    }
  }
  
  
  
 
   
 }
