
int x = 265;
int y = 265;
int vis1 = 255;
int vis2 = 255;
int p = 5;
color c1 = color(0,0,0);
color c2 = color(120,96,216);
color c3 = color(232,40,32);
color c4 = color(216,216,96);
color c5 = color(160,160,32);
color c6 = color(216,144,72);
color c7 = color(248,192,120);
color c8 = color(0,0,0);
color c9 = color(0,0,0);
boolean redhit = false;
boolean grnhit = false;
boolean yelhit = false;
boolean bluhit = false;
boolean allhit = false;
boolean clear = false;

void setup(){
  size(610,610);
}

void keyPressed(){
  if(keyCode == UP){
    if(y>=0){
      y-=35;
    }
  }
  if(keyCode == DOWN){
    if(y<=530){
      y+=35;
    }
  }
  if(keyCode == LEFT){
    if(x>=0){
      x-=35;
    }
  }
  if(keyCode == RIGHT){
    if(x<=530){
      x+=35;
    }
  }
  if((keyCode==RETURN)||(keyCode==ENTER)){
    if((x==160)&&(y==265)&&!clear){
      p=p*0.75;
      vis2=191;
      grnhit = true;
    }
    if((x==370)&&(y==265)&&!clear){
      vis2=127;
      c2 = greyscale(c2);
      c3 = greyscale(c3);
      c4 = greyscale(c4);
      c5 = greyscale(c5);
      c6 = greyscale(c6);
      c7 = greyscale(c7);
      bluhit = true;
    }
    if((x==265)&&(y==160)&&!clear){
      p=p*1.5;
      vis2=64;
      redhit = true;
    }
    if((x==265)&&(y==370)&&!clear){
      vis2=0;
      c1 = invert(c1);
      c2 = invert(c2);
      c3 = invert(c3);
      c4 = invert(c4);
      c5 = invert(c5);
      c6 = invert(c6);
      c7 = invert(c7);
      yelhit = true;
    }
    if(((y < 80) || (x > 440) || (y > 440) || (x < 80))&&!clear){
      p=5;
      vis2=255;
      c1 = color(0,0,0);
      c2 = color(120,96,216);
      c3 = color(232,40,32);
      c4 = color(216,216,96);
      c5 = color(160,160,32);
      c6 = color(216,144,72);
      c7 = color(248,192,120);
      if(redhit&&bluhit&&grnhit&&yelhit){
        allhit = true;
        x = 265;
        y = 265;
      }
    }
    if((x<265)&&clear){
      c8 = color(255,0,0);
    }
    if((x>=300)&&clear){
      c9 = color(255,0,0);
    }
  }
}

void draw(){
  background(255);
  
  noStroke();
  fill(255,0,0);
  rect(285,190,40,40);
  fill(255,255,0);
  rect(285,380,40,40);
  fill(0,255,0);
  rect(190,285,40,40);
  fill(0,0,255);
  rect(380,285,40,40);
  fill(255,255,255,vis2);
  rect(135,135,340,340);
  
  fill(255,0,0);
  rect(295,200,20,20);
  fill(255,255,0);
  rect(295,390,20,20);
  fill(0,255,0);
  rect(200,295,20,20);
  fill(0,0,255);
  rect(390,295,20,20);
  
  if((y < 80) || (x > 440) || (y > 440) || (x < 80)){
    stroke(150,30,200);
    fill(150,30,200);
    rect(0,0,610,135);
    rect(475,0,135,610);
    rect(0,475,610,135);
    rect(0,0,135,610);
    vis1 = 0;
  }
  
  stroke(0);
  fill(255,255,255,vis1);
  rect(135,135,340,340);
  line(305,305,135,135);
  line(305,305,135,475);
  line(305,305,475,135);
  line(305,305,475,475);
  
  if(allhit){
    stroke(255);
    fill(255);
    rect(0,0,610,610);
    stroke(0);
    line(305,0,305,610);
    stroke(c8);
    fill(c8);
    rect(85,260,14,90);
    stroke(c9);
    fill(c9);
    rect(480,260,60,10);
    rect(480,300,60,10);
    rect(480,340,60,10);
    rect(480,310,10,30);
    rect(530,270,10,30);
    clear = true;
  }
  
  stroke(c1);
  fill(c1);
  rect(x+25,y,p*6-1,p-1);
  rect(x+20,y+5,p*9-1,p-1);
  rect(x+15,y+10,p*12-1,p-1);
  rect(x+10,y+15,p*14-1,p-1);
  rect(x+10,y+20,p*13-1,p-1);
  rect(x+15,y+25,p*12-1,p-1);
  rect(x+5,y+30,p*2-1,p-1);
  rect(x+20,y+30,p*11-1,p-1);
  rect(x,y+35,p*16-1,p-1);
  rect(x+5,y+40,p*14-1,p*2-1);
  rect(x+10,y+50,p*13-1,p*2-1);
  rect(x+5,y+60,p*15-1,p*2-1);
  rect(x,y+70,p*16-1,p-1);
  rect(x+5,y+75,p*2-1,p-1);
  rect(x+25,y+75,p*6-1,p-1);
  rect(x+65,y+75,p*2-1,p-1);
  stroke(c2);
  fill(c2);
  rect(x+25,y+5,p*6-1,p-1);
  rect(x+20,y+10,p*9-1,p-1);
  rect(x+15,y+15,p*3-1,p-1);
  rect(x+35,y+15,p*8-1,p-1);
  rect(x+15,y+20,p*10-1,p-1);
  rect(x+20,y+25,p-1,p-1);
  rect(x+55,y+25,p*3-1,p-1);
  rect(x+35,y+60,p*2-1,p-1);
  stroke(c3);
  fill(c3);
  rect(x+15,y+15,p-1,p-1);
  rect(x+35,y+15,p*2-1,p-1);
  rect(x+60,y+15,p-1,p-1);
  rect(x+20,y+20,p-1,p-1);
  rect(x+30,y+20,p*4-1,p*2-1);
  rect(x+55,y+20,p-1,p-1);
  rect(x+5,y+35,p-1,p-1);
  rect(x+70,y+35,p-1,p-1);
  rect(x+10,y+45,p*2-1,p-1);
  rect(x+25,y+45,p-1,p-1);
  rect(x+50,y+45,p-1,p-1);
  rect(x+60,y+45,p*2-1,p-1);
  rect(x+25,y+60,p-1,p*2-1);
  rect(x+50,y+60,p-1,p-1);
  rect(x+45,y+65,p*2-1,p-1);
  rect(x+30,y+70,p*2-1,p-1);
  stroke(c4);
  fill(c4);
  rect(x+35,y+5,p*2-1,p-1);
  rect(x+25,y+10,p-1,p-1);
  rect(x+40,y+10,p*2-1,p-1);
  rect(x+50,y+15,p-1,p-1);
  rect(x+35,y+20,p-1,p-1);
  rect(x+15,y+40,p-1,p-1);
  rect(x+60,y+40,p-1,p-1);
  rect(x+30,y+50,p-1,p-1);
  rect(x+45,y+50,p-1,p-1);
  rect(x+10,y+60,p-1,p*2-1);
  rect(x+30,y+65,p-1,p-1);
  rect(x+70,y+65,p-1,p*2-1);
  rect(x+5,y+70,p-1,p-1);
  rect(x+30,y+75,p-1,p-1);
  stroke(c5);
  fill(c5);
  rect(x+10,y+35,p-1,p-1);
  rect(x+65,y+35,p-1,p-1);
  rect(x+20,y+40,p-1,p-1);
  rect(x+55,y+40,p-1,p-1);
  rect(x+25,y+50,p-1,p-1);
  rect(x+50,y+50,p-1,p-1);
  rect(x+35,y+55,p*2-1,p-1);
  rect(x+35,y+65,p-1,p-1);
  rect(x+10,y+70,p-1,p-1);
  rect(x+25,y+70,p-1,p-1);
  rect(x+45,y+70,p-1,p-1);
  stroke(c6);
  fill(c6);
  rect(x+30,y+25,p-1,p-1);
  rect(x+45,y+25,p-1,p-1);
  rect(x+25,y+35,p-1,p-1);
  rect(x+50,y+35,p-1,p-1);
  rect(x+30,y+40,p-1,p-1);
  rect(x+45,y+40,p-1,p-1);
  rect(x+15,y+55,p-1,p-1);
  rect(x+60,y+55,p*2-1,p*2-1);
  stroke(c7);
  fill(c7);
  rect(x+35,y+30,p-1,p*3-1);
  rect(x+40,y+35,p-1,p*2-1);
  rect(x+10,y+40,p-1,p-1);
  rect(x+65,y+40,p-1,p-1);
  rect(x+30,y+55,p-1,p-1);
  rect(x+45,y+55,p-1,p-1);
  rect(x+60,y+55,p-1,p-1);
  rect(x+35,y+75,p-1,p-1);
}

void invert(color c){
  r = 255-red(c);
  g = 255-green(c);
  b = 255-blue(c);
  return color(r,g,b);
}

void greyscale(color c){
  r = red(c);
  g = green(c);
  b = blue(c);
  val = (r+g+b)/3;
  return color(val);
}


