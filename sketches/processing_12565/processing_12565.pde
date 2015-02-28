
color Brown = color(184,61,44);
color Blue1 = color(10,76,110);
color Blue2 = color(71,53,165);
color Blue3 = color(52,171,184);
int a = 100;
int b = 200;
int c = a+b;
int d = c+b;
int e = 500;
int f = 60;
int g = 650;



void setup(){
  size(930,700);
    background(213,153,255);
    noFill();
    smooth();
}

void draw(){

  fill(30,30,55,10);
  smooth();
  noStroke();
  for(int x = -10; x<1200; x+=150) {
    for(int y=-10; y<800; y+=100){
      ellipse(x,y,170,120);
    }
  }
 
   fill(247,255,255,10);
  smooth();
  stroke(Blue3,3);
  strokeWeight(1);
  for(int x = 300; x<1600; x+=200){
    for(int y = 20; y<1000; y+=120){
      ellipse(x,x+y,240,190);
    }
  }
  
  fill(227,245,255,10);
  smooth();
  stroke(Blue3,3);
  strokeWeight(1);
  for(int x = 100; x<1400; x+=200){
    for(int y = -15; y<1000; y+=120){
      ellipse(x,x+y,210,180);
    }
  }
  
  fill(255,227,227,20);
  smooth();
  stroke(Blue3,5);
  strokeWeight(1);
  for(int x = -15; x<1200; x+=200){
    for(int y = -15; y<800; y+=120){
      ellipse(x,x+y,250,200);
    }
  }
  

  
    strokeWeight(1);
    smooth();
    
    //begin first animal
    fill(Blue1, 10);
    stroke(Blue2);
    ellipse(a,c,b,a-50);
    
    fill(Blue1, 10);
    stroke(Blue2);
    ellipse(c,c,b,a-50);
    
    stroke(Blue2);
    line(0,c,2*b,c);
    
    stroke(Blue2);
    line(b,c,a-25,c-25);
    
    stroke(Blue2);
    line(0,c,a-25,c-25);
    
    stroke(Blue2);
    line(0,c,a-25,c+25);
    
    stroke(Blue2);
    line(a-25,c+25,b,c);
    
    stroke(Blue2);
    line(b,c,c+25,c-25);
    
    stroke(Blue2);
    line(2*b,c,c+25,c-25);
    
    stroke(Blue2);
    line(b,c,c+25,c+25);
    
    stroke(Blue2);
    line(2*b,c,c+25,c+25);
    
    fill(Blue3);
    noStroke();
    triangle(195,400,155,370,145,420);
    
    fill(Blue3);
    noStroke();
    triangle(205,400,245,370,255,420);
    
    fill(Blue1);
    noStroke();
    ellipse(b,c,a+50,b);
    
        beginShape();
    noFill();
    strokeWeight(10);
    stroke(Blue1);
    vertex(b,b+185);
    bezierVertex(100, 400, 250, 500, c+50, 2*b);
    endShape();
    
    fill(Blue2);
    noStroke();
    ellipse(b,c+20,a+30,a+50);
    
    fill(Brown);
    triangle(b-20,246,b+20,246,b,270);
    
    fill(255,130,42);
    triangle(b-10,246,b+10,246,b,270);
    
    fill(255,255,255);
    ellipse(b-20,240,15,15);
    
    fill(255,255,255);
    ellipse(b+20,240,15,15);
    
    fill(Blue1);
    ellipse(b-20,241,10,10);
    
    fill(Blue1);
    ellipse(b+20,241,10,10);
    
    /*strokeWeight(2);
    stroke(255,0,0);
    line(400,0,400,800);*/
    
    
    fill(Blue1);
    noStroke();
    triangle(200,400,155,385,140,390);
    
    fill(Blue1);
    noStroke();
    triangle(200,400,245,385,260,390);
    
    //begin second animal
    strokeWeight(1);
    
    fill(Blue1, 10);
    stroke(Blue2);
    ellipse(e,b,a+50,f);
    
    fill(Blue1, 10);
    stroke(Blue2);
    ellipse(g,b,a+50,f);
    
     stroke(Blue2);
    line(e-75,b,g+75,b);
    
    fill(Brown);
    noStroke();
    triangle(575,275,545,260,510,280);
    
    fill(Brown);
    noStroke();
    triangle(575,275,605,260,640,280);
    
    fill(Blue2);
    noStroke();
    ellipse(e+75,b,a,a+f);
    
        beginShape();
    noFill();
    strokeWeight(10);
    stroke(Blue2);
    vertex(e+75,b+65);
    bezierVertex(400, 400, 750, 300, g, c);
    endShape();
    
    fill(Blue3);
    noStroke();
    ellipse(e+75,b+15,f+10,a);
    
    fill(Brown);
    triangle(e+63,b-35,e+87,b-35,e+75,b-15);
    
    fill(255,130,42);
    triangle(e+68,b-35,e+82,b-35,e+75,b-15);
    
    fill(255,255,255);
    ellipse(e+60,160,15,15);
    
    fill(255,255,255);
    ellipse(e+90,160,15,15);
    
    fill(Blue2);
    ellipse(e+60,161,10,10);
    
    fill(Blue2);
    ellipse(e+90,161,10,10);
    
    /*strokeWeight(2);
    stroke(255,0,0);
    line(400,0,400,800);*/
    
    

    
     //begin third animal
    stroke(Brown);
    strokeWeight(1);
    
    fill(Blue1, 10);
    stroke(Brown);
    ellipse(e-20,e,a+50,f);
    
    fill(Blue1, 10);
    stroke(Brown);
    ellipse(g-20,e,a+50,f);
    
     stroke(Brown);
    line(e-95,e,g+55,e);
    
    fill(Blue2);
    noStroke();
    triangle(255,165,295,165,275,200);
    
    fill(Blue1);
    noStroke();
    ellipse(e+55,e+20,a+20,a+f);
    
        beginShape();
    noFill();
    strokeWeight(10);
    stroke(Blue1);
    vertex(e+55,e-40);
    bezierVertex(400, 400, 750, 300, g-75, c+10);
    endShape();
      
    fill(Blue2);
    noStroke();
    triangle(555,450,525,435,490,440);
    
    fill(Blue2);
    noStroke();
    triangle(555,450,585,435,620,440);
    
    fill(Blue3);
    noStroke();
    ellipse(e+55,e+5,a/2,a+f);
    
    fill(Brown);
    noStroke();
    ellipse(e+55,e+10,a/4,a+40);
    
    fill(Brown);
    triangle(e+40,e+95,e+70,e+95,e+55,e+110);
    
    fill(255,130,42);
    triangle(e+47,e+95,e+63,e+95,e+55,e+110);
    
    fill(255,255,255);
    ellipse(e+35,589,17,14);
    
    fill(255,255,255);
    ellipse(e+75,589,17,14);
    
    fill(Blue3);
    ellipse(e+35,592,12,12);
    
    fill(Blue3);
    ellipse(e+75,592,12,12);
    
    /*strokeWeight(2);
    stroke(255,0,0);
    line(400,0,400,800);*/
    
     //begin fourth animal
    strokeWeight(1);
    
    fill(Blue1, 10);
    stroke(Blue3);
    ellipse(b,a,a+50,f);
    
    fill(Blue1, 10);
    stroke(Blue3);
    ellipse(b+150,a,a+50,f);
    
     stroke(Blue3);
    line(b-75,a,2*b+25,a);
    
    /*
    
    fill(Blue3);
    noStroke();
    triangle(195,400,155,370,145,420);
    
    fill(Blue3);
    noStroke();
    triangle(205,400,245,370,255,420);*/
    
    fill(Blue3);
    noStroke();
    ellipse(b+75,a,a,a+40);
    
        beginShape();
    noFill();
    strokeWeight(10);
    stroke(Blue3);
    vertex(b+75,a+45);
    bezierVertex(200, 140, 450, 300, c, c-10);
    endShape();
    
    fill(Brown,50);
    noStroke();
    ellipse(b+75,a+15,f+10,a-10);
    
    fill(Brown);
    triangle(b+63,a-30,b+87,a-30,b+75,a-10);
    
    fill(255,130,42);
    triangle(b+68,a-30,b+82,a-30,b+75,a-10);
    
    fill(255,255,255);
    ellipse(b+60,60,15,15);
    
    fill(255,255,255);
    ellipse(b+90,60,15,15);
    
    fill(Brown);
    ellipse(b+60,57,10,10);
    
    fill(Brown);
    ellipse(b+90,57,10,10);
    
    /*strokeWeight(2);
    stroke(255,0,0);
    line(400,0,400,800);*/
    
    
    fill(Blue3);
    noStroke();
    triangle(275,165,245,150,210,170);
    
    fill(Blue3);
    noStroke();
    triangle(275,165,305,150,340,170);
    

    

    
    
}
   



    
    
    
  
    


