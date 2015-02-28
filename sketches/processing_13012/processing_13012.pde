
import java.text.DecimalFormat;
import java.text.NumberFormat;


float rotSec = 0,rotMin=0,rotHr=0;
float rotBg = 0;
PFont myFont;
NumberFormat formatter;
Block[] blocks = new Block[0];


void setup(){
  size(600,600);
  frameRate(30);
  background(130, 117, 81);
  smooth();
  strokeCap(SQUARE);
  myFont = createFont("Verdana", 32);
  textFont(myFont,32);
  formatter = new DecimalFormat("00");
  
  
  //test = new Block(55,1,true,100,100);
  
  //blocks = (Block[]) append(blocks, new Block(con));
  

}

void draw(){
  dealBlocks();
  resetMatrix();
  strokeWeight(2);
  translate(0,0);
  fill(187,199,147);
  stroke(241,238,197);
  ellipse(300,300,380,380);
  //rect(0,0,600,600);
  secEffect();
  minEffect();
  hrEffect();
  dealSec();
  dealMin();
  dealHr();
  dealBg();
  dealDig();
}

void dealSec(){
  stroke(130, 117, 81);
  resetMatrix();
  strokeWeight(3);
  rotate(0);
  
  translate(300,300);
  rotate(((2*PI) / 60) * second() - (PI/4) - (PI/2));
  line(130,130,100,100);
  //println(second());
  secEffect();
}

void dealMin(){
  stroke(130, 117, 81);
  resetMatrix();
  strokeWeight(3);
  rotate(0);
  
  translate(300,300);
  rotate(((2*PI) / 60) * minute() - (PI/4) - (PI/2) + ((((2*PI) / 60) * second() - (PI/4) - (PI/2))/60));
  line(100,100,60,60);
  //println(second());
}

void dealHr(){
  stroke(130, 117, 81);
  resetMatrix();
  strokeWeight(3);
  rotate(0);
  
  translate(300,300);
  rotate(((2*PI) / 12) * (hour()%12) - (PI/4) - (PI/2) + ((((2*PI) / 60) * minute() - (PI/4) - (PI/2) + ((((2*PI) / 60) * second() - (PI/4) - (PI/2))/60))/60));
  line(60,60,10,10);
  //println(second());
}

void secEffect(){
  stroke(84,136,68,10);
  rotSec += second()/(2*PI)/200;
  resetMatrix();
  strokeWeight(20);
  translate(300,300);
  rotate(rotSec);
  line(130,130,100,100);

}
void minEffect(){
  stroke(84,136,68,15);
  rotMin += minute()/(2*PI)/200;
  resetMatrix();
  strokeWeight(20);
  translate(300,300);
  rotate(rotMin);
  line(100,100,60,60);

}
void hrEffect(){
  stroke(84,136,68,20);
  rotHr += (hour()%12)/(2*PI)/15;
  resetMatrix();
  strokeWeight(20);
  translate(300,300);
  rotate(rotHr);
  line(60,60,10,10);

}
void dealBg(){
  resetMatrix();
  fill(130, 117, 81,25);
  rect(0,0,600,600);
  stroke(241,238,197,55);
  translate(300,300);
  rotate(rotBg);
  rotBg+= PI*2/150;//900 is cool
  line(10,300,300,10);
  
  resetMatrix();
  stroke(241,238,197,55);
  translate(300,300);
  rotate(-rotBg);
  line(10,300,300,10);
  
  resetMatrix();
  stroke(241,238,197,55);
  translate(300,300);
  rotate(-rotBg + PI);
  line(10,300,300,10);
  
  resetMatrix();
  stroke(241,238,197,55);
  translate(300,300);
  rotate(rotBg + PI);
  line(10,300,300,10);

}

void dealDig(){
  resetMatrix();
  textAlign(CENTER);
  fill(0);
  text("" + hour()%12 + ":" + formatter.format(minute()) + ":" + formatter.format(second()), 300, 316);
}

void dealBlocks(){
  resetMatrix();
  if(blocks.length < 50){
    switch((int)random(0,2)){
      case 0: switch((int)random(0,2)){
        case 0: blocks = (Block[]) append(blocks, new Block((int)random(25,75),(int)random(-1,-3),true,(int)random(300,600),(int)random(300,600)));break;
        case 1: blocks = (Block[]) append(blocks, new Block((int)random(25,75),(int)random(-1,-3),false,(int)random(300,600),(int)random(300,600)));break;
      }
      case 1: switch((int)random(0,2)){
        case 0: blocks = (Block[]) append(blocks, new Block((int)random(25,75),(int)random(1,3),true,(int)random(0,300),(int)random(0,300)));break;
        case 1: blocks = (Block[]) append(blocks, new Block((int)random(25,75),(int)random(1,3),false,(int)random(0,300),(int)random(0,300)));break;
      }
      
    }

  }
  for(int i=0;i<blocks.length;i++){
    if(blocks[i].draw()){
      blocks = delItem(blocks,i);
    }
  }

}

Block[] delItem(Block[] tmp, int toDel){
  return (Block[]) concat((Block[]) subset(tmp,0,toDel),(Block[]) subset(tmp,toDel+1));
}


