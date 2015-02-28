
//Kate Easton
//Assignment 1
//TITLE "Dont take advantage of our resources"
//CONCEPT
//The idea for my assignment was inspired by the information I learnt in geography at school about the limted resources that earth has and how
//we will run out of resources if we continue to rapdily use what we have. I wanted to create a dramatic response and showing the effect that 
//using all our resources would have, the loss of biodiversity and our earth!
//In my presentation, as the earth grows and the person moves around the earth, the earth changes colour showing how humans are changing 
//the earth. When the earth reaches a certain width, it dissappears because humans have "touched" and harmed the earth too much.
//Then with mouse pressed my message is shown to make people realise the importance of preserving our resources they abuse on earth. 
//ENJOY!
//my inspiration was simply drawn from playing with the exercises founf in the textbook

Star myStar;
Star myStar2;
Star myStar3;
Star myStar4;
Star myStar5;
Star myStar6;
Star myStar7;
Star myStar8;
Star myStar9;
PFont f;
PImage img;
PImage img2;
int w = 70;//image width variable
int h = 70;//image height variable
int x = 600;// variable for text speed
int y = 300;//variable for text location
int speed = 1; //variable for speed of growth for image
boolean stay = false; //variable for mousepressed

void setup(){
  size(600,600);
  noCursor();
  img = loadImage("earth.png");//load earth image 
  img2 = loadImage("girl.gif");//load young girl image 
  myStar = new Star(color(255), 200,200,5,5);//creating each star  
  myStar2 = new Star(color(255),200,200,7,7);//creating each star 
  myStar3 = new Star(color(255),200,200,6,6);//creating each star 
  myStar4 = new Star(color(255),200,200,6,6);//creating each star 
  myStar5 = new Star(color(255),200,200,6,6);//creating each star 
  myStar6 = new Star(color(255),200,200,6,6);//creating each star 
  myStar7 = new Star(color(255),200,200,5,5);//creating each star 
  myStar8 = new Star(color(255),200,200,5,5);//creating each star 
  myStar9 = new Star(color(255),200,200,5,5);//creating each star 
  f = loadFont("AmericanTypewriter-Light-48.vlw");//loading the type of font to use for assignment
}


void draw(){
    background(0);
    myStar.move();//assigning stars to move & display in different direction
    myStar.display();
    myStar2.move2();//assigning stars to move & display in different direction
    myStar2.display();
    myStar3.move3();//assigning stars to move & display in different direction
    myStar3.display();
    myStar4.move4();//assigning stars to move & display in different direction
    myStar4.display();
    myStar5.move5();//assigning stars to move & display in different direction
    myStar5.display();
    myStar6.move6();//assigning stars to move & display in different direction
    myStar6.display();
    myStar7.move7();//assigning stars to move & display in different direction
    myStar7.display();
    myStar8.move8();//assigning stars to move & display in different direction
    myStar8.display();
    myStar9.move9();//assigning stars to move & display in different direction
    myStar9.display();

    imageMode(CENTER);
    {tint(95+mouseX, 41+mouseY, 41);//changing colour of earth as mouse mouves
    image(img,200,200,w,h);}//loading position and the variables
    w=w+speed;//image grows in terms of width
    h=h+speed;//image grows in terms of height
       { //code for moving person on top of earth
        //person moves with the mouse
        //body
        fill(225);
        triangle(mouseX+85,mouseY+160,mouseX+95, mouseY+125, mouseX+105, mouseY+160);
        //head
        fill(255);
        ellipse(mouseX+95,mouseY+110,30,30);          
        //eyes
        fill(10,250,219);
        stroke(255);
        ellipse(mouseX+88,mouseY+105,4,4);
        ellipse(mouseX+103,mouseY+105,4,4);          
        //smile
        noFill();
        stroke(0);
        bezier(mouseX+85, mouseY+115,  mouseX+90,  mouseY+125,  mouseX+100,  mouseY+125,  mouseX+105,  mouseY+115);
        //legs
        stroke(255);
        line(mouseX+92,mouseY+160,mouseX+82,mouseY+180);
        line(mouseX+98,mouseY+160,mouseX+108,mouseY+180);
        //arms
        stroke(255);
        line(mouseX+90,mouseY+135,mouseX+75,mouseY+128);
        line(mouseX+97,mouseY+135,mouseX+112,mouseY+128);
       }
        
            if (w>600 && h>600){//declaring a condition
              w=600;
              h=600;
              fill(0);//image disappears when it reaches 600 in width and height and sad girl appears
              rectMode(CENTER);
              rect(300,300,650,650);
               //body
                    fill(225);
                    triangle(275,260,285,225,295,260);
                    //head
                    fill(255);
                    ellipse(285,210,30,30);
                    //eyes
                    fill(10,250,219);
                    stroke(255);
                    ellipse(278,205,4,4);
                    ellipse(293,205,4,4);
                    //smile
                    noFill();
                    stroke(0);
                    bezier(278,217,283,212,287,212,292,217);
                    //legs
                    stroke(255);
                    line(282,260,272,280);
                    line(288,260,298,280);
                    //arms
                    stroke(255);
                    line(280,235,265,248);
                    line(287,235,302,248);
                    }
               
                  textFont(f,15);//declaring display of font
                  fill(255);//white
                  text("if humans continue to touch and harm the earth...soon there will be no earth",x,500,20);
                      x=x-1;//allows text to move from right to left
            
              if (keyPressed){//if mouse pressed the earth dissapears and text appears with a girl pointing 
                stay = true;//declaring boolean true
                    }
                      if (stay){
                      fill(0);//black
                      rectMode(CENTER);
                      rect(300,300,650,650);
                      textFont(f,30);
                      fill(255,3,24);//red
                      text("don't take advantage of our resources",5,y,20);  
                      tint(200,200,200);
                      imageMode(CENTER);
                      image(img2,width/2,150,200,250);//view image of 
            }
        } 
 
//declaring variables for stars in a class
//void dispay is also part of the clas for the stars to appear
          class Star{
            color c;
            float xpos;
            float ypos;
            float xspeed;
            float yspeed;
            int thesize;
            
          Star(color tempC, float tempXpos, float tempYpos, int tempSize, float tempSpeed){
            c = tempC;
            xpos = tempXpos;
            ypos=tempYpos;
            xspeed=tempSpeed;
            yspeed=tempSpeed;
            thesize=tempSize;
          }
          
    void move(){//star top right corner
      xpos=xpos+xspeed/3;//direction of star
      ypos=ypos-yspeed/3;
        if(xpos>width && ypos<height){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move2(){//star bottom right corner
      xpos=xpos+xspeed/3;//direction of star
      ypos=ypos+yspeed/3;
        if(ypos>height && xpos>width){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move3(){//star bottom left corner
      xpos=xpos-xspeed/3;//direction of star
      ypos=ypos+yspeed/3;
        if(ypos>height && xpos<width){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move4(){// star bottom left section
      xpos=xpos-xspeed/4+2;//direction of star
      ypos=ypos+yspeed/4+2;
         if(ypos>height && xpos<width){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move5(){//star bottom left section
      xpos=xpos-xspeed/4+1;//direction of star
      ypos=ypos+yspeed/4+1;
        if(ypos>height && xpos<width){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move6(){//star top right section
      xpos=xpos+xspeed/4+2;//direction of star
      ypos=ypos-yspeed/4+2;
        if(ypos<height && xpos>width){//repeating when star reaches edge
          xpos=300;
          ypos=300;
      }
    }
    void move7(){//star top right section
      xpos=xpos+xspeed/3+0.5;//direction of star
      ypos=ypos-yspeed/3+0.5;
        if(xpos>width && ypos<height){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move8(){//star bottom left section
      xpos=xpos-xspeed/3+0.5;//direction of star
      ypos=ypos+yspeed/3+0.5;
        if(ypos>height && xpos<width){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }
    void move9(){//star top right section
      xpos=xpos+xspeed/3+1;//direction of star
      ypos=ypos-yspeed/3+1;
        if(xpos>width && ypos<height){//repeating when star reaches edge
          xpos=200;
          ypos=200;
      }
    }

void display(){//code for appearance of the stars
    stroke(255);
    fill(c);
    ellipseMode(CENTER);
    int offset = thesize/4;
    ellipse(xpos,ypos,thesize,thesize/2);
    }  
  }

