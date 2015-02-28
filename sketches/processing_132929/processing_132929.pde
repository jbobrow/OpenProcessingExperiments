
// Naomi Rauch, CS118
//for-loop sketch due Feb. 11 2014
//Set background 
size(1000, 400);
background(255); 
fill(255,255,0);
noStroke();
rect (0,0, width,147);
fill(118,199,197);
noStroke();
rect (0,147, width,height);
smooth();

//A Wave drawn with lines on Paint to get get coordinates of vertex. 
//initial shape
/*beginShape();
vertex(165,147);
vertex(181,108);
vertex(201,78);
vertex(222,58);
vertex(247,44);
vertex(276,39);
vertex(304,46);
vertex(322,59);
vertex(328,81);
vertex(325,102);
vertex(315,117);
vertex(303,107);
vertex(283,104);
vertex(270,117);
vertex(269,134);
vertex(285,148);
vertex(310,150);
vertex(333,142);
vertex(351,127);
endShape();
*/
//draw more waves with for-loop
int c = 255; //changes transparency with x and y coordinates
noStroke();

      for(int x = 0; x <=width ; x += 100) {
          for (int y = 0; y <= height; y += 100) {
          fill(0,100,255,c);
          beginShape();
          vertex((0+x),147+y);
          vertex((16+x),108+y);
          vertex((36+x),78+y);
          vertex((57+x),58+y);
          vertex((82+x),44+y);
          vertex((111+x),39+y);
          vertex((139+x),46+y);
          vertex((157+x),59+y);
          vertex((163+x),81+y);
          vertex((160+x),102+y);
          vertex((150+x),117+y);
          vertex((138+x),107+y);
          vertex((118+x),104+y);
          vertex((105+x),117+y);
          vertex((104+x),134+y);
          vertex((120+x),148+y);
          endShape(CLOSE);
          c = c - 5;
          
          }
      }




