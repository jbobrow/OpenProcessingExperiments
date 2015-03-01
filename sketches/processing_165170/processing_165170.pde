
//Arthur Luo//

//Print Toy//

//Oct.7.2014//


PImage feather_pen_cursor, marker_cursor, brush_cursor;
PImage canvas;
PImage feather;
float drawingtool;
float ballsize;


void setup(){
  
  //Canvas size 800*800
  size( 800, 800);
  
  //Cursors.
  brush_cursor = loadImage("paint_brush_cursor.png");
  marker_cursor = loadImage("marker_cursor.png");
  feather_pen_cursor = loadImage("feather_pen_cursor.png");
  canvas = loadImage("canvas.jpg");
  feather = loadImage("feather.png");
  
  //Brush circle size.
  ballsize == random(50);
}
  

void draw(){   
  
   //How to select three kinds of drawing tools.
  if(mouseX>=550 && mouseY>=124 && mouseY<168){
    if(mousePressed==true){
      cursor(feather_pen_cursor);
      drawingtool = 1;
    }
  }
  if(mouseX>=550 && mouseY>=190 && mouseY<234){
    if(mousePressed==true){
      cursor(marker_cursor);
      drawingtool = 2;
    }
  }
  if(mouseX>=550 && mouseY>=240 && mouseY<312){
    if(mousePressed==true){
      cursor(brush_cursor);
      drawingtool = 3;
    }
  }  
    
    
  //Three kinds of drawing tool.
  if(drawingtool==1){
    if(mousePressed==true){
      image(feather,mouseX-140,mouseY-98);  
    }
  }
  if(drawingtool==2){
    if(mousePressed==true){
      stroke(#000000);
      strokeWeight(10);
      line(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
  if(drawingtool==3){
    if(mousePressed==true){
      noStroke();
      fill(random(255),random(255),random(255));
      ellipse( mouseX-random(50), mouseY-random(50), random(50), random(50));
      ellipse( mouseX-random(50), mouseY-random(50), random(50), random(50));
      ellipse( mouseX-random(50), mouseY-random(50), random(50), random(50));
      ellipse( mouseX-random(50), mouseY-random(50), random(50), random(50));
    }
  }
}


//Blanck canvas everytime you move your mouse out.
void mouseOut(){
  image(canvas,0,0);
  image(feather_pen,550,124);//250*44
  image(marker,550,190);//250*44
  image(brush,550,240);//250*72
}



