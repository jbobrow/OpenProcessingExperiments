

int borde = 20;
int hoover = 5;
int borde_hoover;
PImage a;
PImage b;
PImage c;
PImage d;

void setup(){
  size(800,600);
  frameRate (25);
 // smooth();
  background(#ededfe);
  a = loadImage("javi_img_01.gif");
    b = loadImage("perfil.gif");
        c = loadImage("flickr.gif");
            d = loadImage("pma3.gif");
}

void draw()
{
  background(#ededfe);
  drawR_1(width/2-borde,height/2-borde,width/4,height/4);
    draw_tip();
  drawR_2(width/2-borde,height/2-borde,width-width/4,height/4);
    draw_tip2();
  drawR_3(width/2-borde,height/2-borde,width/4,height-height/4);
        draw_tip3();
  drawR_4(width/2-borde,height/2-borde, width-width/4,height-height/4);
     draw_tip4();
     }



void draw_tip()
{
  if(mouseX > borde_hoover && mouseX < width/2-borde_hoover && mouseY > borde && mouseY < height/2-borde_hoover ){
    textSize ( 30);
  fill (255); 
  text ( "GALERIE",mouseX-60,mouseY);
   } else {
     
}
}


  void draw_tip2(){

  if( mouseX > width/2+borde_hoover && mouseX < width-borde_hoover && mouseY > borde && mouseY < height/2-borde_hoover ){
    textSize ( 30);
  fill (255); 
  text ( "ARCHIV",mouseX-50,mouseY);
   } else {
     
}
}


  void draw_tip3(){

  if(mouseX > borde && mouseX < width/2-borde_hoover && mouseY > height/2 && mouseY < height-borde_hoover ){
    textSize ( 30);
  fill (255); 
  text ( "SAMMLUNG",mouseX-90,mouseY);
   } else {
     
}
}


void draw_tip4(){

  if(mouseX > width/2+borde_hoover && mouseX < width- borde && mouseY > height/2+borde_hoover && mouseY < height-borde_hoover ){
    textSize ( 30);
  fill (255); 
  text ( "VERKÄUFLICHE WERKE",mouseX-110,mouseY);
   } else {
     
}
}


void drawR_1( int tam_x, int tam_y, int rx_pos, int yx_pos )
{
  fill (0);
  imageMode(CENTER);
  noStroke ();
  if(mouseX > borde_hoover && mouseX < width/2-borde_hoover && mouseY > borde && mouseY < height/2-borde_hoover ){
      tam_x += hoover ;
           tam_y += hoover ;
           cursor(HAND);
  } else {
      tam_x -=hoover ;
            tam_y -=hoover ;
            cursor(ARROW);
  }
  image (c , rx_pos, yx_pos , tam_x, tam_y);  
}


void drawR_2 ( int tam_x, int tam_y, int rx_pos, int yx_pos )
{
  fill (0);
  imageMode(CENTER);
  noStroke ();
  if (mouseX > width/2+borde_hoover && mouseX < width-borde_hoover && mouseY > borde && mouseY < height/2-borde_hoover ){

     tam_x += hoover ;
            tam_y += hoover ;
  } else {
      tam_x -=hoover ;
            tam_y -=hoover ;
  }

  image (a, rx_pos, yx_pos , tam_x, tam_y);
}




void drawR_3 ( int tam_x, int tam_y, int rx_pos, int yx_pos )
{
  fill (0);
  imageMode(CENTER);
  noStroke ();
  if (mouseX > borde && mouseX < width/2-borde_hoover && mouseY > height/2 && mouseY < height-borde_hoover ){

    tam_x += hoover ;
            tam_y += hoover ;
  } else {
      tam_x -=hoover ;
            tam_y -=hoover ;
  }

  image (d, rx_pos, yx_pos , tam_x,tam_y);
}




void drawR_4 ( int tam_x, int tam_y, int rx_pos, int yx_pos )
{
  fill (0);
  imageMode ( CENTER);
  noStroke ();
  if (mouseX > width/2+borde_hoover && mouseX < width- borde && mouseY > height/2+borde_hoover && mouseY < height-borde_hoover ){

     tam_x += hoover ;
            tam_y += hoover ;
  } else {
      tam_x -=hoover ;
            tam_y -=hoover ;
  }


  image (b, rx_pos, yx_pos , tam_x,tam_y);
}







void mousePressed()
{ 
    if (mouseX > borde_hoover && mouseX < width/2-borde_hoover && mouseY > borde && mouseY < height/2-borde_hoover && mousePressed == true ){
  link("http://processing.org");
}

} 


