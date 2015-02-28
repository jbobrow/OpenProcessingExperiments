
int card = 0;    



PFont f;    

PShape f1,  f2;

PImage img1, img2, img3;

float angle = 0.0;  







void setup() {    



  size(600,600);    



  smooth();    



  f = loadFont("Garamond-Italic-48.vlw");    

  img1 = loadImage("green.jpg");  

  img2 =  loadImage("green2.JPG");

  img3= loadImage ("startrail_fireflyvi09.jpg");

  f1= loadShape("ca.svg");  

  f2= loadShape("bi.svg");  

  textFont(f);
}    







void draw() {    



  if (card == 0) {    

    image(img1,0,0,width,height);  

    shape(f1,80,90,width,height*2);  


    fill(255);  

    text("My loneliness will be gone if i would be a stunning photuris!" 

      ,300,80, width/2, height);
  }    











  else if (card == 1) {    

    background(0);  

    fill(255);  

    text("Time went by, and...." 

      ,130,280, width, height);
  }    



  else if (card == 2) {    

    background(0);    

    image(img1,0,0,width,height);  

    fill(254,255,0);  

    stroke(300);  

    text("Finally i came to be a photuris! now i can make lots of friends!",  

    80,360, width/2.1, height*2);  

    translate(mouseX,mouseY);  

    rotate(angle);    

    photuris1(280,20, 1, 255, 255 );  

    angle += 0.5;
    frameRate(5);
    
  }    



  else if (card == 3) {    

    background(0);    

    image(img2,0,0,width,height);  

    photuris2(350,160, 1, 150);    

    fill(0,255,206);  

    stroke(300);  

    text("Hey buddies!",  

    180,420, width/2, height*2);  

    text("let's hang with....",180,470,width/2, height*2);  

    fill(247,98,5);  

    text("Eeeeew......who is that creepy insect? it's not even worth eating!",  

    280,20,width/2,height*2);  

    shape(f2,5,5,width/1.5,height*1);
  }    



  else if (card == 4) {    

    background(0);  

    text("Why? am i really creepy? worthless? please, don't leave me. sing for me!! ",  

    140,180, width/1.53, height);
  }    



  else if (card == 5) {    

    background(214);  

    photuris3(350,100, 2, 255, 120, 0, 120 ); 

    fill(53,93,52);  

    stroke(300);  

    smooth();  

    text("Don't cry, you're not alone. we can make beautiful light with our own gift, which nobody can imitate!",  

    10,160, width/1.5, height*2);
  }    



  else if (card == 6) {  

    background(0);  

    image(img3,0,0,width,height);  

    text("Don't ask for happiness in the distance!",330,20, width/2, height);  



    translate(mouseX,mouseY);  

    rotate(angle);  



    photuris(100,100, 1, 255, 133, 243 );    



    photuris(250,100, 2, 50, 0, 154);    



    photuris(250,280, 0.5, 160, 255, 75);    



    photuris(100,210, 0.1, 70, 70, 98);    



    photuris(100,80,0.3, 100, 30, 255);    



    photuris(280,60, 0.2, 160, 156, 0);    



    angle += 0.5;
     frameRate (6);
  }
}  





void photuris(int x, int y, float s, int t, int w,int v) {    



  pushMatrix();    



  noStroke();    



  translate(x,y);    



  scale(s);    



  smooth();    







  //wings    



  fill(w,v,252);    



  ellipse(150,210,180,40);    



  ellipse(50,210,180,40);    



  ellipse(130,240,140,20);    



  ellipse(50,240,140,20);    



  //body    



  fill(137,89,62);    



  ellipse(100,210,80,160);    



  //eyes    



  fill(201,223,234);    



  ellipse(80,130,80,80);    



  ellipse(120,130,80,80);    



  fill(0);    



  ellipse(80,140,40,40);    



  ellipse(120,140,40,40);    



  //tail    



  fill(t,255,0);    



  ellipse(100,300,40,40);    



  popMatrix();
}  





void mousePressed() {    



  if (card == 0) {    



    card = 1;
  }    



  else if (card == 1) {    



    card = 2;
  }    



  else if (card == 2) {    



    card = 3;
  }    



  else if (card == 3) {    



    card = 4;
  }    



  else if (card == 4) {    



    card = 5;
  }    



  else if (card == 5) {    



    card = 6;
  }    



  else if (card == 6) {    



    card = 0;
  }    

}    











void photuris1(int x, int y, float s, int t, int w) {    



  pushMatrix();    



  noStroke();    



  translate(x,y);    



  scale(s);    



  smooth();    







  //wings    



  fill(w);    



  ellipse(150,210,200,60);    



  ellipse(50,210,200,60);    



  ellipse(130,250,140,20);    



  ellipse(50,250,140,20);    



  //body    



  fill(116,61,16);    



  ellipse(100,210,80,160);    



  //eyes    



  fill(201,223,234);    



  ellipse(80,130,80,80);    



  ellipse(120,130,80,80);    



  fill(0);    





  ellipse(80,140,40,40);    

  ellipse(120,140,40,40);    



  //tail    



  fill(t,255,0);    



  ellipse(100,300,40,40);    



  popMatrix();
}  





void photuris2(int x, int y, float s, int t) {    



  pushMatrix();    



  noStroke();    



  translate(x,y);    



  scale(s);    



  smooth();    







  //wings    



  fill(0,232,193);    



  ellipse(150,210,200,50);    



  ellipse(50,210,200,50);    



  ellipse(130,240,140,20);    



  ellipse(50,240,140,20);    



  //body    



  fill(106,74,35);    



  ellipse(100,210,80,160);    



  //eyes    



  fill(201,223,234);    



  ellipse(80,130,80,80);    



  ellipse(120,130,80,80);    



  fill(0);    



  ellipse(80,140,40,40);    



  ellipse(120,140,40,40);    



  //tail    



  fill(t,247,230);    



  ellipse(100,300,60,60);    



  popMatrix();
}  





void photuris3(int x, int y, float s, int t, int w, int c, int d) {    



  pushMatrix();    



  noStroke();    



  translate(x,y);    



  scale(s);    



  smooth();    







  //wings    



  fill(w);    



  ellipse(150,210,180,40);    



  ellipse(50,210,180,40);    



  ellipse(130,240,140,20);    



  ellipse(50,240,140,20);    



  //body    



  fill(c,89,62);    



  ellipse(100,210,80,160);    



  //eyes    



  fill(201,223,d);    



  ellipse(80,130,80,80);    



  ellipse(120,130,80,80);    



  fill(255);    



  ellipse(80,140,40,40);    



  ellipse(120,140,40,40);    



  //tail    



  fill(t,255,0);    



  ellipse(100,300,40,40);    



  popMatrix();
} 


