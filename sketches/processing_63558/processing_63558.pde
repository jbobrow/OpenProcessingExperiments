
import ddf.minim.*;
AudioPlayer player;
AudioSample kick;
Minim minim;

PFont font;

//setup the car 
float car_x;
float car_y;
float car_dir = 1;
float car_size =20;
float dy =0;
float time=0;              //------------------setup timer and score
float score=0;
float level=1;


//setup the wall
int wall_width = 10;
int wall_height =35;

void setup(){
  size(400,300);
  smooth();
  rectMode(CENTER);
  car_x = height/2;
  car_y = car_size/2;
  
  font =loadFont("Aharoni-Bold-48.vlw");
  textFont(font,15);
  
  minim = new Minim(this);
  player = minim.loadFile("background miusc.mp3", 2000);
  kick = minim.loadSample("BD.mp3", 2000);
  
}

void draw(){
  background(200);
  strokeWeight(1);
  player.play();
  
  time+=0.03333333333;
  car_dir+=0.001;
  car_x +=car_dir*2.0;
  car_y +=dy;
  if(car_x > width+car_size){
    car_x =random( -width/2,0);
    car_y = random(30,height-car_size/2);
    dy = 0;
  }
  
  float wall_y = constrain(mouseY,wall_height/2+20,height-wall_height/2);//--congstrain the wall 
  float wall_x = constrain(mouseX,105,width-wall_width);
  
  float touching = mouseX-car_size*1.5/2;//------------------if touching
  fill(255);
  rect(car_x,car_y,car_size*1.5,car_size);
  
  if(car_x>touching && mousePressed&&
    car_x<touching+wall_width/2&&
    car_y > wall_y - wall_height/2 - car_size/2&&
    car_y < wall_y + wall_height/2 + car_size/2){
    car_x = random(-width,0);
    car_y = random(car_size/2+20,height);
    fill(255,0,0);
    score+=1;
    if(score>8){score+=1;}               //----------------the more score the fast get the scores.
    if(score>32){score+=2;}
    kick.trigger();
  }
 
  rect(car_x,car_y,car_size*1.5,car_size);//---------display //显示
  rect(wall_x,wall_y,wall_width,wall_height);
  line(100,0,100,300);
  stroke(255);
  line(0,20,500,20);
  
  text("timer;",0,15);  //display font
  text("score(            )",280,15);
  text("level(        )",320,290);
  
  fill(255,0,0);
  text(time,45,15);
  text(score,320,15);
  text(level,355,290);
  
  
  //game begining
  if(time<120 && score>=80){          //--------------------------if game Wictroy
   noLoop();       text("Wictory",width/2,height/2);
   strokeWeight(4);
   fill(200);
   stroke(100);
   ellipse(125,height-30, 34,34);
   fill(255);
   strokeWeight(1);
   beginShape();
   vertex(125-15,height-30-5);
   vertex(125-15,height-30+5);
   vertex(125,height-30+5);
   vertex(125,height-30+13);
   vertex(125+15,height-30);
   vertex(125,height-30-13);
   vertex(125,height-30-5);
   vertex(125-15,height-30-5);
   endShape(CLOSE);
   car_dir=1.2;
   level+=1;
}
  
  if(time>120 && score<80){          //--------------------------if game lose
   noLoop();   text("lose",width/2,height/2);   
   strokeWeight(4);
   fill(200);
   stroke(100);
   ellipse(125,height-30, 34,34);
   noStroke();
   fill(255);
   triangle(125,height-45,135,height-22,115,height-22);
   car_dir=1;
  }  
}


void mousePressed(){         //---------------------------if  the game "lose" or "wictory" repeat the game
  if(dist(mouseX,mouseY,125,height-30)<20 && ((time<120 && score>=80) || (time>120 && score<80))){
    time=0;    score=0;
    loop();
    player.rewind();
    player.play();
  }
}







                          //——————————说明————————————//
                          //------------如果你没有这种字体开始要修改一下字体才行-----------/



//鼠标在右下角正方向活动区域内控制游戏    ------------   mousePressed
//不可以越过白线之外
//在靠近白线的左边吃分数最快     速度快就要远一点 不然容易失误 给自己留点时间----------------------------经验   
//car运动越快吃分数越快
//120秒内got score(80)  you are Wictory     -------否则 --------      you are lose the game  

//get score(80) you have pass next "leve"l
//得到score（80）进行下一关
//but wthen you lose the game ,you must begining on the fist "level"




                           //   ...........简单吧 haha.........    //








