
size (792, 232, P2D);
//learned about  P2D on an online forum. It tells the program to render in 2D

//Background gradient
//I could not understand the references guide on making a gradient in a shape but I did understand how to makw a gradient with a stoke and a vertex
beginShape();
  strokeWeight(792);
  stroke(#838d7e); //greenish color
  vertex(0, 116); // point on the left
  stroke(#c1716c); //redish color
  vertex(396, 116); //point in the middle
  stroke(#685f66); // grayish purple color
  vertex(796, 116); // point on the right
endShape();

//the lines
int x1 = 0;
int x2 = 796;
int y1 = 56;

noFill();
stroke(#f1f1f2, 95);
strokeWeight(2.5);

line(x1, y1, x2, y1);
  line(x1, y1 + 7, x2, y1 + 7);
  line(x1, y1 + 7 * 2, x2, y1 + 7 * 2);
  line(x1, y1 + 7 * 3, x2, y1 + 7 * 3);
  line(x1, y1 + 7 * 4, x2, y1 + 7 * 4);
  line(x1, y1 + 7 * 5, x2, y1 + 7 * 5);
  line(x1, y1 + 7 * 6, x2, y1 + 7 * 6);
  line(x1, y1 + 7 * 7, x2, y1 + 7 * 7);
  line(x1, y1 + 7 * 8, x2, y1 + 7 * 8);
  line(x1, y1 + 7 * 9, x2, y1 + 7 * 9);
  line(x1, y1 + 7 * 10, x2, y1 + 7 * 10);
  line(x1, y1 + 7 * 11, x2, y1 + 7 * 11);
  line(x1, y1 + 7 * 12, x2, y1 + 7 * 12);
  line(x1, y1 + 7 * 13, x2, y1 + 7 * 13);
  line(x1, y1 + 7 * 14, x2, y1 + 7 * 14);
  line(x1, y1 + 7 * 15, x2, y1 + 7 * 15);
  line(x1, y1 + 7 * 16, x2, y1 + 7 * 16);
  line(x1, y1 + 7 * 17, x2, y1 + 7 * 17);
  
  
//curves
stroke(#f7931d,180);
  strokeWeight(15);
  bezier(0, 36, 106, 114, 504, 93, 480, 160);
  bezier(480, 160, 565, 200, 796, 70, 796, 70);
  strokeWeight(8);
  bezier(0, 72, 216, 144, 395, 144, 394, 176);
  bezier(394, 176, 434, 214, 648, 180, 792, 218);
  strokeWeight(10);
  bezier(0,32,145,145,435,108,684,145);
  bezier(684,145,792,106,792,106,792,106);
  strokeWeight(9);
  bezier(254,145,336,200,542,178,792,150);
stroke(#e31e25,180);
  strokeWeight(18);
  bezier(0,39,255,141,471,175,436,142);
  bezier(436,142,612,148,718,255,792,180);
  strokeWeight(3);
  bezier(0,180,360,150, 630, 144, 792,72);
  bezier(0,130,260,170,396,214,792,175);
  bezier(0,24,108,194,516,72,792,60);
stroke(#731112,180);
  strokeWeight(15);
  bezier(0,38,255,145,150,180,792,140);
  strokeWeight(5);
  bezier(0,70,181,107,324,105,504,178);
  bezier(504,178,792,160,792,160,792,160);
  bezier(0,38,183,142,327,138,434,150);
  bezier(434,150,650,132,792,175,792,175);
  strokeWeight(8);
  bezier(0,72, 72,102,326,250,396,144);


//big important circles and triangle
noStroke ();
fill (115, 17, 18, 190); //dark  red
ellipse (259, 98, 148, 148);
fill (239, 72, 85); // light red
ellipse (259, 98, 108, 108);
stroke(#f1f1f2); // light gray
strokeWeight(4);
noFill();
triangle(242, 77, 242, 119, 282, 98);

//lots of squares!
strokeWeight(1);
rect(92, 38, 15, 15);
rect (87, 33, 25, 25);
rect(141, 186, 7, 7);
rect(369, 189, 14, 14);
rect(361.5, 181, 29, 29);
rect(344, 75, 4, 4);
rect(342, 73, 8, 8);
rect(507, 42, 6, 6);
rect(503, 38, 14, 14);

//dem quads
quad(318, 157, 315, 159.5, 318, 162, 321, 159.5);
quad(318, 154, 312, 159.5, 318, 165, 324, 159.5);
quad(729.5, 107, 716, 120.5, 729.5, 134, 743, 120.5);
quad(729.5, 103, 712, 120.5, 729.5, 138, 747, 120.5);
quad(421.5, 17.5, 415, 24, 421.5, 30.5, 428, 24);
quad(421.5, 12, 410, 24, 421.5, 36, 433.5, 24);

//dat arc
strokeWeight(5);
arc(259, 98, 200, 200, PI/2, TWO_PI-PI/1.3);
noStroke();
fill(#f1f1f2);
ellipse(182, 35, 15, 15);
ellipse(260, 198, 15, 15);

















