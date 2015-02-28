
PImage nextFrame;
int pen = 2;  //size of pen
int B = color(0);   //black color
boolean pause=false;  //indeicates if program is paused

void setup() {
  size(500,500);
  background(0);
  
  nextFrame = createImage(width, height, RGB);
  loadPixels();
  arraycopy(pixels, nextFrame.pixels);    //save a copy of actual screen
  ellipseMode(CENTER);
  noStroke();
  
  /*frame.addMouseWheelListener(  //change of pensize whenever is mousewheel rotated
    new MouseWheelListener(){
    void mouseWheelMoved (MouseWheelEvent e){
        pen+=0-e.getWheelRotation();   
        if(pen<0)pen=0;
    }}
  );*/
}
void draw() {
  loadPixels(); 
  arraycopy(pixels, nextFrame.pixels);   //save a copy of actual screen
  for(int x=0;x<width;x++){
    for(int y=0;y<height;y++){    //for every pixel
      int count=0;             //indicates how many color pixels are around actual pixel
      int[] colors = new int[8];      //what are colors of them
      int col[] = {0,0,0};            //sum of all the colors of surrounding pixels, to calculate the average
      
      if(get(x,y)==B){           //only for blank pixels
        for(int dx=-1;dx<2;dx++){       //for each surrounding pixel
          for(int dy=-1;dy<2;dy++){
            if((dx!=0|dy!=0)&dx+x>0&dy+y>0&dx+x<width&dy+y<height){   //if it is not actual pixel and if it is not on edges of screen
              if(get(x+dx,y+dy)!=B){    //if it isn't black
                count++;                 //increrase number of non-black pixels
                colors[count-1] = get(x+dx,y+dy);   //add color of this pixel to array
              }
            }
          }
        }
        if(count!=0){     //if there are some pixels around
          if(random(0,0.5*(9-count))<1){   //chance to be actual pixel colored is based on the number of non-black surrounding pixels
            for (int i=0;i<count;i++){     //counting the individual color components of surrounding pixels
              col[0] += red(colors[i]);
              col[1] += green(colors[i]);
              col[2] += blue(colors[i]);
            }
            col[0] /= count;col[1] /= count;col[2] /= count;   //making an average color 
            if (!pause) nextFrame.pixels[y*width+x] = color(col[0],col[1],col[2]); //painting actual pixel
          }
        }
      }
      else{   //if actual pixel isn't black
        count=0;   //reset the counter
        for(int dx=-1;dx<2;dx++){
          for(int dy=-1;dy<2;dy++){
            if(dx!=0|dy!=0&dx+x>0&dy+y>0&dx+x<width&dy+y<height){
              if(get(x+dx,y+dy)!=color(0)){
                count++;
                colors[count-1] = get(x+dx,y+dy);
              }
            }
          }
        }
        if (!pause && count>2) { //if there are less than 3 pixels around, cell/pixel will die
            //uncomment commented lines to something like blur effect
            /*for (int i=0;i<count;i++){
              if (color(colors[0],colors[1],colors[2])==color(0)){
              col[0] += red(colors[i]);
              col[1] += green(colors[i]);
              col[2] += blue(colors[i]);}
            }
            col[0] /= count;col[1] /= count;col[2] /= count;*/
            nextFrame.pixels[y*width+x] = get(x,y); //nextFrame.pixels[y*width+x] = color(col[0],col[1],col[2]);
        }
        else nextFrame.pixels[y*width+x] = B;
      }
    }
  }
  arraycopy(nextFrame.pixels, pixels); 
  updatePixels(); 
  if(mousePressed & mouseY < height){if(mouseButton == RIGHT)stroke(0);else stroke(random(256),random(256),random(256));strokeWeight(pow(pen,2));line(mouseX,mouseY,pmouseX,pmouseY);stroke(127);strokeWeight(1);}  //painting with mouse
}

void keyPressed(){
  switch (key) {
    case '*':  //pause game, it is bugging
      pause=!pause;
      break;
    case ' ':
      noStroke();fill(0);rect(0,0,width,height);  //clear screen
      break;
    case 's':
      save("sav.jpg");  //save screen
      break; //uncomment if you downloaded it
  }
  
}

