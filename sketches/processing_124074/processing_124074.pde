
//Fall,falling,fallen
//Homework:2013-12-11
//Echo Chen (puyce7244@yahoo.com.tw)
//concept:Snowflakes is fluttering(change the movement),and two pieces collide change into water.
//Reference:(http://www.openprocessing.org/sketch/45429) learning movement and buttoms.


boolean pressed=false, showswfs = true, showlines = true, showmids = true;
//Make a name,Swfs=snowflake.
Swfs[] swfs= {
};
float dis;
//One clilk comes two snowflake!
int num=2;

void setup() {
  size(700, 350);
  noStroke();
  smooth();
  frameRate(24);
}


void draw() {
  //background
  noStroke();
  fill(71, 103, 179, 50);
  rect(0, 0, width, height);
  //buttom
  fill(0);
  rect(500, 280, 350, 30 );
  rect(460, 280, 30, 30);
  rect(420, 280, 30, 30);
  fill(255, 255, 255);
  //the name of the work
  fill(255, 255, 255);
  text("Snowflake | Fall,Falling,Fallen", width-170, height-50);
  //the star filled with colour is "show".
  if (showswfs) {
    text("★", 429, 300);
  } 
  else {
    text("☆", 429, 300);
  }
  if (showlines) {
    text("★", 470, 300);
  } 
  else {
    text("☆", 470, 300);
  }
  if (showmids) {
    text("★", 510, 300);
  } 
  else {
    text("☆", 510, 300);
  }

  //data category
  //in the class practice,i just using"drawMe",but in this
  // practice i sperated three part.

  for (int i=0;i<swfs.length;i++) {
    swfs[i].mov();
    if (showswfs) {
      swfs[i].paint();
    }
    swfs[i].collide();
  }
}


//Object properties 
class Swfs {
  float x, y, xmove, ymove, rad, alph;
  boolean touch;
  //Object constructurtor
  Swfs() {
    rad = random(35)+5;
    alph = 255;
    xmove = random(10)-5;
    ymove = random(10)-5;
    if (xmove == 0) {
      xmove++;
    }
    if (ymove == 0) {
      ymove++;
    }
    x = random(rad, width-rad);
    y = random(rad, height-rad);
  }

  //Object method (function)
  void mov() {
    x += xmove;
    y += ymove;
    if (x-rad<0 || x+rad>width) {
      xmove *= -2;
    }
    if (y-rad<0 || y+rad>height) {
      ymove *= -2;
    }
  }

  void paint() {
    fill(63, 22, 27, alph);
    fill(122, 22, 49, alph);
    /*ellipse(x, y, rad*2, rad*2);*/
    snowflake();
  }
  void snowflake() {
    stroke(255, 90);
    strokeWeight(3);
    line(x, y, x, y-rad);
    line(x, y, x, y+rad);
    line(x, y, x+rad*0.8, y-rad*0.6);
    line(x, y, x+rad*0.8, y+rad*0.6);
    line(x, y, x-rad*0.8, y-rad*0.6);
    line(x, y, x-rad*0.8, y+rad*0.6);
    line(x-rad*0.5, y-rad*0.3, x-rad*0.5, y-rad*0.6);
    line(x-rad*0.5, y+rad*0.3, x-rad*0.5, y+rad*0.6);
    line(x-rad*0.5, y-rad*0.3, x-rad*0.8, y-rad*0.3);
    line(x-rad*0.5, y+rad*0.3, x-rad*0.8, y+rad*0.3);
    line(x+rad*0.5, y-rad*0.3, x+rad*0.5, y-rad*0.6);
    line(x+rad*0.5, y+rad*0.3, x+rad*0.5, y+rad*0.6);
    line(x+rad*0.5, y-rad*0.3, x+rad*0.8, y-rad*0.3);
    line(x+rad*0.5, y+rad*0.3, x+rad*0.8, y+rad*0.3);
  }


  void collide() {
    touch = false;
    for (int i=0;i<swfs.length;i++) {
      Swfs other = swfs[i];
      if (other!=this) {
        dis = dist(other.x, other.y, x, y)-other.rad-rad;
        if (showlines && dis < 75) {
          stroke(159, 186, 249, 200);
          strokeWeight(1);
          line(other.x, other.y, x, y);
          noStroke();
        }
        if (showmids && dis < 0 && alph > 0) {
          touch = true;
          noStroke();
          fill(117, 247, 255,90);
          ellipse((other.x+x)/2, (other.y+y)/2, dis, dis);
        }
      }
    }
    if (touch && alph > 20) {
      alph-=2;
    }
    if (!touch && alph < 200) {
      alph+=5;
    }
  }
}
void  drawSnowflake() {
  for (int i=0; i<num; i++) {
    swfs = (Swfs[])append(swfs, new Swfs());
    swfs = (Swfs[])append(swfs, new Swfs());
    println(swfs.length);
  }
};
void mouseClicked() {
  drawSnowflake();

  if (mouseY>=280 && mouseY<=310) {
    if (mouseX>=420 && mouseX<=450) {
      if (showswfs) {
        showswfs=false;
      } 
      else {
        showswfs=true;
      }
    }
    if (mouseX>=460 && mouseX<=490) { 
      if (showlines) {
        showlines=false;
      } 
      else {
        showlines=true;
      }
    }
    if (mouseX>=500 && mouseX<=530) {
      if (showmids) {
        showmids=false;
      } 
      else {
        showmids=true;
      }
    }
  }
}



