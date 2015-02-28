


int a;



void setup(){

  size(1280,800);

  background(255);

  smooth();

//  noStroke();

//  noFill;

}



void draw(){



  strokeWeight(0.4*random(1));

  stroke(40,random(40));

  //fill(random(255),random(255),random(255),random(100));

pushMatrix();

  translate(640,400);

  rotate(100+(0.1*a));

  noFill();

//  ellipse(0+(random(90+(0.01*a)),0+random(90+(0.01*a)),300,300);

    ellipse(random(90),random(90),550,550);

    ellipse(230+(random(80)),230+(random(80)),30,30);

      ellipse(230+(random(80)),230+(random(80)),70,70);

      ellipse(230+(random(80)),230+(random(80)),30,30);

      ellipse(230+(random(80)),230+(random(80)),30,30);

      line(0,0,random(600),random(512));



     

      //stroke(255);

     // strokeWeight(2);

          ellipse(random(90),random(90),550,550);

          noStroke();

     //fill(0,random(10));

            ellipse(150+(random(180)),150+(random(180)),30,30);

                  fill(0,random(5));

            ellipse(80+(random(180)),80+(random(180)),30,30);

    popMatrix();

   



    pushMatrix();

  translate(640,512);

  rotate(100+(0.1*a));

  noFill();

//  ellipse(0+(random(90+(0.01*a)),0+random(90+(0.01*a)),300,300);

    ellipse(random(90),random(90),550,550);

    ellipse(230+(random(80)),230+(random(80)),30,30);

      ellipse(30+(random(80)),30+(random(80)),70,70);

      ellipse(30+(random(80)),30+(random(80)),30,30);

      ellipse(230+(random(80)),230+(random(80)),30,30);



     

      //stroke(255);

     // strokeWeight(2);

          ellipse(random(90),random(90),550,550);

          noStroke();

     //fill(0,random(10));

            ellipse(150+(random(180)),150+(random(180)),30,30);

                  fill(0,random(5));

            ellipse(80+(random(180)),80+(random(180)),30,30);

    popMatrix();

   

   

   

  rotate(100+(0.1*a));

  //rect(380+(random(40)),272+random(30),500,500);

a++;

frameRate(3000);

};






