void keyPressed() {
  xspan = Math.abs(xrange/zoom-xRange/zoom);
  yspan = Math.abs(yrange/zoom-yRange/zoom);
  switch(key) {
  case'w':
   yoff-=yspan/4;  redrawf();break;
  case'a':
   xoff-=xspan/4; redrawf();break;
  case's':
   yoff+=yspan/4; redrawf();break;
  case'd':
   xoff+=xspan/4; redrawf();break;
  case'x':
   mit++;redrawf();break;  
   case'y':
   mit--;redrawf();break;
   case'c':
   zoom*=10;redrawf();break;
   case'v':
   zoom/=9;constrain(zoom,1,100000000000L);redrawf();break;
   case '0':
   zoom = 1; xoff= 0; yoff = 0; redrawf();break;
   case 'h':
   cline = !cline;break;
   case 'g':
   export();break;
   case 'j':
   redrawf();break;
  
 }
  
}

   void export(){
  float[] data = graphMouseDistances();
  float pivot = data[0];
  for(int i =0; i < data.length; i++){
    if(data[i]>pivot){
      print("1   ");
      pivot = data[i];
    }else{
      print("-1  ");
    pivot = data[i];  
  }
  
    
  }
  println("a");
    
    
    
    
    
    
  } 
  
  
  
  
  
  void mouseClicked(){
   float mappedX = gmx();
   float mappedY = gmy();
    
    float[] finalc = graphMouseDistances();
    
    println("mouseX: " + mappedX + " mouseY: "+ mappedY);
    println("after " + mit + " itterations: " );
    println("finalX: " + finalc[mit-1] + " finalY: "+ finalc[mit-1] );
    
    
    
    
  }
