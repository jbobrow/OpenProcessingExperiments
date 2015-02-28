
import processing.video.*;
Capture video;

import traer.physics.*;
Particle attractor;
Particle [] others;
ParticleSystem physics;

float exposure;
int sum =300;
int count_pt;
int temp;


int color_num =4;// 색 변경을 위한 함수 배열 넘버 저장.
int[][] ch_Color = {
  {
    255, 0, 0
  }
  , {
    0, 255, 0
  }
  , {
    0, 0, 255
  }
  , {
    255, 255, 0
  }
  , {
    173, 173, 173
  }
};
//2차원 배열로 컬러값 저장
void setup(){
  video = new Capture(this, 160, 120);
  video.read();
  size (1440, 900);
  frameRate(24);
  cursor(MOVE);
  smooth();
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  noCursor();

  physics = new ParticleSystem(0, 0.1);
  attractor = physics.makeParticle();
  attractor.makeFixed();
  others = new Particle[sum];
  for (int i=0; i<others.length; i++) {
    others[i] = physics.makeParticle(1.0, random(0, width), random(0, height), 0);
    physics.makeAttraction(attractor, others[i], 22000, 50);
  }
 
}
void draw() {

  
  
  attractor.position().set(mouseX, mouseY, 0);
  physics.tick();
  background(255);
  for (int i=0; i<others.length; i++) {
    Particle p = others[i];
    ellipse(p.position().x(), p.position().y(), 8, 8);
    if (video.available()) {
      video.read();
      
    }
    image(video, mouseX, mouseY);
    imageMode(CENTER);

    float totalPixel = video.width*video.height;
    float totalColor = 0;

    for (int x=0; x < video.width; x++) {
      for (int y=0; y < video.height; y++) {
        int loc = x+y*video.width;
        color pixelColor = video.pixels[loc];
        float temp = (red(pixelColor)+blue(pixelColor)+green(pixelColor))/3;
        totalColor = totalColor+temp;
      }
    }
    exposure = totalColor/totalPixel;
    
    
    println(exposure);
  }
  
  //choice - 3
  if(exposure > 90) {
    fill(0);
    /*if(sum <=300)
    {
      if(sum >=1)
      {
        temp = second();
        temp += second();
        sum -= temp;
      }
    }*/
    
  }
  if(exposure<=90 &&  exposure >= 85) {
    fill(204,61,61);
  }
   if(exposure<85 &&  exposure >= 70) {
    fill(204,114,61);
  }
   if(exposure<70 &&  exposure >= 65) {
    fill(250,237,125);
  } 
   if(exposure<65 &&  exposure >= 60) {
    fill(67,126,217);
  } 
  if(exposure<60 &&  exposure >= 55) {
    fill(217,65,140);
  } 
    if(exposure<10) {
    fill(255);
  }
  text(exposure , 400,400);
  /*if(exposure%10>15) {
    others = [60];
  } */ 

  //if (keyPressed == true)//키가 눌러졌다면?
  //{
  /* if (exposure%10 > 15)// 다시 키가 눌러졌는데 그게 A 버튼이라면? 
    {
      color_num=0;
      
    }
    else if (key=='s'||key=='S')
    {
      color_num=1;
    }
    else if (key=='d'||key=='D')
    {
      color_num=2;
    }
    else if (key=='F'||key=='f')
    {
      color_num=3;
    }
    else if (key=='G'||key=='g')
    {
      color_num=4;
    } */
  //}
  // ASDFG 각각의 키를 누를때 마다 색변경
  //fill(ch_Color[color_num][0], ch_Color[color_num][1], ch_Color[color_num][2]);
  
}


