
PImage pic_a = loadImage("free_032_03.gif");
;

int Pos;
color C;
float B;

PFont Font;

//pic_a.loadPixels();

size(900, 500);
colorMode(HSB,pic_a.width*2,width,width,width);
translate(200,0);

background(width, 0,width);
strokeWeight(1);
smooth();
Font = loadFont("HelveticaNeue-UltraLight-48.vlw");
textFont(Font,12);

rotate(radians(-25));
translate(-200,100);


for(int i=0;i<pic_a.width;i+=2){
  for(int j=0;j<pic_a.height;j+=2){
    Pos = (j * pic_a.width) + i;
    C = pic_a.pixels[Pos];
    B = brightness(C);

    if(B<width){

      float grow_x = pic_a.width*.9; 
      float grow_y = pic_a.height*.5; 



      noFill();
      stroke(i*3,width,0,width);
      float n = random(-20,20);
      ellipse(i*3+grow_x*-2, j*3-grow_y*2, n, n);

      fill(i*3,width,width,width*.7);
      float m = random(-20,20);
      rect(i*3+grow_x*-1, j*3-grow_y, m, m);

      noStroke();
      fill(i*3,width,0,width);
      rect(i*3, j*3,5,5);

      fill(i*3,width,width,width*.3);
      float k =random(0,10);
      ellipse(i*3+grow_x, j*3+grow_y, 5+k, 5+k);

      fill(i*3,width,0,width*.3);
      pushMatrix();
      translate(i*3+grow_x*2, j*3+grow_y*2);
      rotate(radians(random(360)));
      rect(0, 0, 15, 15);
      popMatrix();

      String japan;
      int bai = int(random(0,3));
      if(bai==0){
        japan = "J";
      }
      else if(bai==1){
        japan = "A";
      }
      else if(bai==2){
        japan = "P";
      } 
      else{
        japan = "N";
      }

      fill(random(pic_a.width),width,width,width);
      text(japan,i*3+grow_x*3, j*3+grow_y*3);

      strokeWeight(.3);
      stroke(j*3,width,0,width);
      float l =random(-10,10);
      line(i*3+grow_x*4, j*3+l+grow_y*4, i*3+grow_x*4+40, j*3+l+grow_y*4 );
      float o =random(-10,10);
      line(i*3+grow_x*4, j*3+o+grow_y*4, i*3+grow_x*4+40, j*3-o+grow_y*4 );


    }
  }

}

