
/*there are three different modes: taking camera input, taking a single image input 
and taking itself as input. it is necessary to comment out all of the lines in the
mode you aren't using before launching the program. to do this, put // infront of the lines.
right now the program is set to take an itself. There are comments on which lines 
you need to take out.
drag mouse to edit the 'cells', and it will edit the point on a normal grid which 
the mouse is closest to, rather than where the point is right then. white triangles 
will be formed if you make a cell that can't have an image mapped to it, like a triangle.
there are presets of the shape of the grid: 1 and 4 are square like, 2 and 5 
are sinusoidal, 3 is bulgy, and 6 is noise, and looks best with the stroke on and
with a large grid.
press 'a' to map the grid size between 1 and 20 on your horizontal mouse position
press 's' to toggle the stroke on and off
press 'q' to make the grid random
press space to set the grd to normal
press 'E' to toggle the drawing of ellipses on and off
press 'e' to place up to 20 ellipses on the screen, but only when ellipses are toggled on
press 'i' to draw lots of points, their number limited by the leng variable.*/

//import processing.video.*;//webcam input
//Capture cam;//webcam
float c;
int n,leng=2000; int[][] dr=new int[leng][2];
PImage img;int i, a,b,px,py,ere;int rec=5;
int mx[][]=new int[20][20];int my[][]=new int[20][20];int ell[][]=new int[20][2];
int lin[][]=new int[20][4];
boolean st,ellipses,lines;color pop=color(0,150,254);
void setup(){
  //String loadPath = selectInput();  //single image input, and for some reason
  //img = loadImage(loadPath);//single image
  textureMode(NORMALIZED);
  //smooth();//this just changes quality, but not enough to be that noticeable
  //size(img.width,img.height,P2D);//single image input
  size(640,480,P2D);// self  and webcam
  stroke(255);
  background(255);
  img=createImage(width,height,RGB);//input self
  img=get();//inpt self
  //cam=new Capture(this,width,height);//webcam input
  a=width/rec;b=height/rec;
  background(255);
  loadPixels();
}
void draw (){
  //cam.read();//webcam input
  if(lines){
    pushStyle();
    strokeWeight(10);
    stroke(255);
    for(int x=0;x<20;x++){
      if(lin[x][3]!=0){
        line(lin[x][0],lin[x][1],lin[x][2],lin[x][3]);
      }
    }
    popStyle();
  }
  if(ellipses){
    for(int x=0;x<20;x++){
      if(ell[x][0]!=0){
        ellipse(ell[x][0],ell[x][1],40,40);
      }
    }
  }
  for(int x=0;x<leng;x++){
      if(dr[x][0]!=0){
        pixels[dr[x][0]+dr[x][1]*width]=pop;
      }
  }
  img.loadPixels();//self input for all three
  arrayCopy(pixels,img.pixels);//self 
  img.updatePixels();//self
  for(int x=0;x<width-1;x+=a){
    for(int y=0;y<height-1;y+=b){
      beginShape();
      texture(img);//change img to cam if webcam input
      vertex(x+mx[x/a][y/b],y+my[x/a][y/b], norm(x,0,width), norm(y,0,height));
      vertex(x+a+mx[x/a+1][y/b],y+my[x/a+1][y/b], norm(x+a,0,width), norm(y,0,height));
      vertex(x+a+mx[x/a+1][y/b+1],y+b+my[x/a+1][y/b+1], norm(x+a,0,width),norm(y+b,0,height));
      vertex(x+mx[x/a][y/b+1],y+b+my[x/a][y/b+1], norm(x,0,width),norm(y+b,0,height));
      endShape();
    }
  }
  updatePixels();
  c+=.05;
}
void mousePressed(){
  px=mouseX;py=mouseY;
   
}
void mouseDragged(){
  
  int ex=(px-px%a)/a;
  if(px%a>a/2){ex++;}
  int wy=(py-py%b)/b;
  if(py%b>b/2){wy++;}
  mx[ex][wy]=mouseX-px;
  my[ex][wy]=mouseY-py;
}
void keyPressed(){
  switch(key){
    case 'a':
  rec=int(map(mouseX,0,width,1,19));
  a=width/rec;b=height/rec;
  break;
  case 's':
  if(st){
    noStroke();
    st=false;
  }else{
    stroke(255);
    strokeWeight(2);
    st=true;
  }
  break;
  case ' ':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=0;
      my[x][y]=0;
    }
  }
  for(int x=0;x<leng;x++){
    dr[x][0]=0;
  }
  break;
  case 'q':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(random(-8,8));
      my[x][y]=int(random(-8,8));
    }
  }
  break;
  case '1':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(sin(map(x,0,rec,0,2*TWO_PI))*16);
      my[x][y]=int(sin(map(y,0,rec,0,2*TWO_PI))*16);
    }
  }
  break;case '2':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(sin(map(y,0,rec,0,2*TWO_PI))*16);
      my[x][y]=int(sin(map(x,0,rec,0,2*TWO_PI))*16);
    }
  }
  break;case '3':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(sqrt(1-sq(norm(y,rec/2,rec)))*rec*2-rec);
      my[x][y]=int(sqrt(1-sq(norm(x,rec/2,rec)))*rec*2-rec);
    }
  }
  break;
  case '4':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(cos(map(x,0,rec,0,2*TWO_PI))*16);
      my[x][y]=int(sin(map(y,0,rec,0,2*TWO_PI))*16);
    }
  }
  break;
  case '5':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(cos(map(y,0,rec,0,2*TWO_PI))*16);
      my[x][y]=int(cos(map(x,0,rec,0,2*TWO_PI))*16);
    }
  }
  break;case '6':
  for(int x=0;x<20;x++){
    for(int y=0;y<20;y++){
      mx[x][y]=int(noise(y,c)*10-5);
      my[x][y]=int(noise(x,c)*10-5);
    }
  }
  break;
  case 'E':
  ellipses=(ellipses) ? false :true;
  break;
  case  'e':
  ell[i][0]= mouseX+1;ell[i][1]=mouseY;
  i=(i+1)%20;
 break; 
 case 'i':
  dr[n][0]=constrain(mouseX,0,width-1);dr[n][1]=constrain(mouseY,0,height-1);
  n=(n+1)%leng;
  break;
  case 'l':
  lin[ere][0]=px;
  lin[ere][1]=py;
  lin[ere][2]=mouseX;
  lin[ere][3]=pmouseY;
  ere=(ere+1)%20;
  break;
  case 'L':
  lines=(lines) ? false:true;
  }
  
}

