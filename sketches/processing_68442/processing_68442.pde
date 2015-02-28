
//Richard May rwmay@andrew.cmu.edu
//Copyright 2012


//declare x,y and w and h for (width and height)
//elipse corner

size (400,400);
background (179,210,227);
smooth();

float x, y, wd,ht;
x = width* .5;
y = height * .5;
wd =300;
ht = 300;


noFill();
stroke (220,220,220);
strokeWeight(3);
fill(225,225,225,0);
ellipse(x ,y ,wd ,ht);
ellipse(1.1 * x,1.1 * y,wd,ht);
ellipse(x,y, .7 * wd, .7 * ht);
fill(225,0,0,20);
ellipse(1.1 * x,1.1 * y,wd,ht);
//strokeWeight(1);

//higer y = lower
//higer x = right
//beginShape();
////R
//  curveVertex(x-wd/3,y+ht/10);//curve define
//  curveVertex(x-wd/2.5,y+ht/3.2);//1
//  curveVertex (x-wd/3, y-ht/6);//2
//  //curveVertex();//5
// // curveVertex();//7
//  //curveVertex();//8
//  //curveVertex();//6
//  curveVertex(x - wd/4, y-ht/3);//4
//  curveVertex(x-wd/2,y-ht/2);//3
//  curveVertex (x+wd/2, y-ht/3);//curve define
//  
//endShape();

beginShape();
  //R
    //strokeWeight (30);
    stroke(137,0,9);
    curveVertex(x-wd/1,y+ht/10);//curve define
    curveVertex(x-wd/2.5,y+ht/3.2);//1
    curveVertex(x - wd/2.4, y-ht/3);//3
    curveVertex(x-wd/10,y-ht/3);//5
    curveVertex(x-wd/3, y-ht/20);//8
    curveVertex(x-wd/5,y+ht/2);//9
    curveVertex(x-wd/10,y+ht/6);//curve define
endShape();

//strokeWeight (10);
stroke (144,174,255);
point (x-wd/2.5,y+ht/3.2);//1
point (x - wd/2.4, y-ht/3);//3
point (x-wd/10,y-ht/3);//5
point (x-wd/3, y-ht/20);//8
point (x-wd/5,y+ht/2);//9

//noFill();
fill(0,225,0,20);
beginShape();
  //W
    stroke (206,117,0);
    curveVertex(x-wd/7,y-ht/1);
      curveVertex (x-wd/3.5, y-ht/20);//8
      curveVertex(x-wd/6.3,y+ht/2);//9
      curveVertex(x-wd/12, y-ht/20);//8
      curveVertex(x+wd/4,y+ht/2);//9
      curveVertex(x+wd/2,y-ht/16);//9
     curveVertex(x+wd/5,y-ht/3);
endShape();

stroke (225,225,225);
point (x-wd/3.5, y-ht/20);//8
point (x-wd/6.3,y+ht/2);//9
point (x-wd/12, y-ht/20);//8
point (x+wd/4,y+ht/2);//9
point (x+wd/2,y-ht/16);//9

fill(0,0,225,20);
beginShape();
  //M
    stroke(98,1,87);
  curveVertex (x-wd/8,y-ht/10);
    curveVertex(x-wd/5, y+ht/3);
    curveVertex(x-wd/8, y-ht/6);
    curveVertex(x+wd/4, y+ht/3);//8
    curveVertex(x+wd/2, y-ht/7);
    curveVertex(x+wd/1.8, y+ht/3);
  curveVertex(x+wd/2,y-ht/4);
endShape();
    
    
    
point (x-wd/5, y+ht/3);
point (x-wd/8, y-ht/6);
point (x+wd/4, y+ht/3);//8
point (x+wd/2, y-ht/7);
point (x+wd/1.8, y+ht/3);

//saveFrame("hw2.jpg");

