# MandelbrotAnalyser
Program for analysis of the mandelbrot set in processing



How to open;
  Make a new folder and clone / coppy all the .pde files into it. 
  Start your processing enviroment, go to file and click open, navigate to newly created folder and open the mandelbrot_analyser.pde. It should automatically open up the other files as well. 
  


How and what to use:
  On start progrma opens 3 windows;
  -largest one is your primary view,
  -second image of the set, is used for navigation and shows you where you are currently located, the red rectanhgle represents the area visible within the main window, the line is the itteration orbit of the point located at the mouse currsor,
  -third window with the flasing line. this line is the graph of distance (Y axis) and itteration number (X axis) of the point at mouse Cursor. it graphs how far away the point zn is at some itteration from 0,0. If graph flattens point converges to some fixed point. if it explodes off screen the point diverges to infinity.


viewport- area of the fractal currently visible in the main window

Usefull controlls:
  -**W**: moves your viewport upwards by 25%,
  -**A**: moves your viewport left by 25%,
  ... same for S and D. 


  -**X**: increases the maximum number of itterations by 1,
  -**Y**: decreases the maximum number of itterations by 1,

  -**C**: increases zoom by factor of 10,
  -**V**: decreases zoom by factor of 9,

  -**0**: resets the viewport to default view, (zooms out completly focuses on 0,0)

  -**H**: toggles the visibility of the orbit, of the point at the mouse currsor, 

  -**G**: outputs value n, maxItteration number of times:
    <br>  -n will be -1 if current distance of zn from 0,0 is smaller than the previous one 
    <br>  -n will be 1, if current distance of zn from 0,0 is greather than previous one

  -**J**: redraws the set, keeping all settings. 
  
  
  

