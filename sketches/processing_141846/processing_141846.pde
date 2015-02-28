
/* @pjs preload="haili.jpg, yanhua.jpg"; */


  size(500,500);
  PImage sfondo = loadImage("haili.jpg");
  PImage yanhua = loadImage("yanhua.jpg");
  
  background(sfondo);
  

 tint( 250,100 );
  image(yanhua, 0,0);
  
 save("hecheng.jpg");

  



