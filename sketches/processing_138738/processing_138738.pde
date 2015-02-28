
float i=0, j=25, a=0;
float biggness=50;
float frames2=0;
color lines = color(175);
float lineWidth = 1.5;
color boxes = color(235);
color inBox = color(100);
float colorDamp = 5.5;
float c = 225; //(i/colorDamp+j/colorDamp)
//float[] randoms = new float[500];
int k=0;
int t=1;
void setup(){
  background(20);
  size(850,600);

/*  for(i=0;i<500;i++){ //x
    randoms[i]=random(360);
    
  } */
  stroke(lines);
  strokeWeight(lineWidth);
  for(a=biggness/2+50;a<width+biggness;a+=2*biggness){
    line(a-25/8,j,a-25/8,j+50);
    line(a+25/8,j,a+25/8,j+50);
  }
  line(0,25*3/8+biggness/4,width,25*3/8+biggness/4);
  line(0,25*5/8+biggness/4,width,25*5/8+biggness/4);
  line(width/2-25/8,0,width/2-25/8,height);
  line(width/2+25/8,0,width/2+25/8,height);
  noStroke();
  for(j=biggness/2;j<height+biggness;j+=biggness){ //y
    for(i=biggness/2;i<width+biggness;i+=biggness){ //x
    
      if(k==0){
        fill(c);
        rect(i-biggness/4,j-biggness/4,25,25);
 /*       fill(inBox);
        rect(i-biggness/4,j-biggness/4,10,10);
        */
      }
      else if(k%2 == 1){
        if(t<9){
          stroke(lines);
          strokeWeight(lineWidth);
          if(t%2==1){
            line(i-25/8,j,i-25/8,j+50);
            line(i+25/8,j,i+25/8,j+50);
            line(i,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
            line(i,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);
          }
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
        }
        if(t==9){
/*          stroke(175);
          strokeWeight(1.5);
          line(i,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
          line(i,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);*/
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
        }
        if(t>9){
          stroke(lines);
          strokeWeight(lineWidth);
          if(t%2==0){
            line(i,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
            line(i,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);
          }
          if(t%2==1){
            line(i-25/8,j,i-25/8,j+50);
            line(i+25/8,j,i+25/8,j+50);
          }
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
        }
        t++;

      }
      else{
        if(t<9){
          stroke(lines);
          strokeWeight(lineWidth);
          if(t==1){
            line(0-25,j-25+25*3/8+biggness/4,0-25+50,j-25+25*3/8+biggness/4);
            line(0-25,j-25+25*5/8+biggness/4,0-25+50,j-25+25*5/8+biggness/4);
            line(375-25/8,j,375-25/8,j+50);
            line(375+25/8,j,375+25/8,j+50);
            line(375+100-25/8,j,375+100-25/8,j+50);
            line(375+100+25/8,j,375+100+25/8,j+50);
          }
          if(t%2==0 && t!=8){
            line(i-25/8,j,i-25/8,j+50);
            line(i+25/8,j,i+25/8,j+50);
            line(i,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
            line(i,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);
          }
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
        }
        if(t==9){
          stroke(lines);
          strokeWeight(lineWidth);
          line(i-50,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
          line(i-50,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
          rect(i-biggness/4-50,j-biggness/4,25,25);
        }
        if(t>9){
          stroke(lines);
          strokeWeight(lineWidth);
          if(t%2==1){
            line(i,j-25+25*3/8+biggness/4,i+50,j-25+25*3/8+biggness/4);
            line(i,j-25+25*5/8+biggness/4,i+50,j-25+25*5/8+biggness/4);
          }
          if(t%2==0){
            line(i-25/8,j,i-25/8,j+50);
            line(i+25/8,j,i+25/8,j+50);
          }
          noStroke();
          fill(c);
          rect(i-biggness/4,j-biggness/4,25,25);
        }
        t++;
      }
    } 
    t=1;
    k++;
  }

}

/*void draw(){
  background(20);
  frames2++;
  if(frames2>=360){
    frames2=0;
  }

}*/
