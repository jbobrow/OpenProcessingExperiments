
float r = 1500; // suface radius
float p = 2000; // Sphere radius
float delta = 2;
float r_b = 20; // body radius
float r_h = 700; // body height
float r_f = 60; // face radius
float rX, rY; // rotate X, rotate Y
float count = 0; // count
float sw = 4; // strokeweight about constellation
void setup() {
size(2000, 1300, P3D);
}
void draw() {
background(0);
float tX = width/2, tY = height/2 + 500;
translate(tX, tY, 0);
if (mouseY<850 && mouseY>350) {
rotateX(radians(mouseY/3));
} else if (mouseY>=850) {
rotateX(radians(850/3));
rotateY(radians(mouseY/3));
}
else if (mouseY<=350){
rotateX(radians(350/3));
rotateY(radians(mouseY/3)); 
}
rotateY(radians(mouseX/3));

//////////////////////////////////// draw constellation ////////////////////////////////////////////
pushMatrix(); // Save before coordinates system

translate(0, height/2 - tY, 0);
noFill();

//////// draw Little Bear ///////////
// draw point Little Bear
stroke(random(255));
strokeWeight(sw);
float xLB_1 = p * sin(radians(-0.5)) * cos(radians(-0.5));
float yLB_1 = p * cos(radians(-0.5));
float zLB_1 = p * sin(radians(-0.5)) * sin(radians(-0.5));
point( xLB_1, yLB_1, zLB_1);
float xLB_2 = p * sin(radians(5)) * cos(radians(5));
float yLB_2 = p * cos(radians(5));
float zLB_2 = p * sin(radians(5)) * sin(radians(5));
point( xLB_2, yLB_2, zLB_2);
float xLB_3 = p * sin(radians(10)) * cos(radians(-0.5));
float yLB_3 = p * cos(radians(10));
float zLB_3 = p * sin(radians(10)) * sin(radians(-0.5));
point( xLB_3, yLB_3, zLB_3);
float xLB_4 = p * sin(radians(15)) * cos(radians(-20));
float yLB_4 = p * cos(radians(15));
float zLB_4 = p * sin(radians(15)) * sin(radians(-20));
point( xLB_4, yLB_4, zLB_4);
float xLB_5 = p * sin(radians(20)) * cos(radians(-42));
float yLB_5 = p * cos(radians(20));
float zLB_5 = p * sin(radians(20)) * sin(radians(-42));
point( xLB_5, yLB_5, zLB_5);
float xLB_6 = p * sin(radians(24)) * cos(radians(-37));
float yLB_6 = p * cos(radians(24));
float zLB_6 = p * sin(radians(24)) * sin(radians(-37));
point( xLB_6, yLB_6, zLB_6);
float xLB_7 = p * sin(radians(19)) * cos(radians(-10));
float yLB_7 = p * cos(radians(19));
float zLB_7 = p * sin(radians(19)) * sin(radians(-10));
point( xLB_7, yLB_7, zLB_7);
float xLB_e = p * sin(radians(15)) * cos(radians(-20));
float yLB_e = p * cos(radians(15));
float zLB_e = p * sin(radians(15)) * sin(radians(-20));
point( xLB_e, yLB_e, zLB_e);
// end point Little Bear
// draw Line
if (key == '1' || key == '5'){
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xLB_1, yLB_1, zLB_1);
vertex( xLB_2, yLB_2, zLB_2);
vertex( xLB_3, yLB_3, zLB_3);
vertex( xLB_4, yLB_4, zLB_4);
vertex( xLB_5, yLB_5, zLB_5);
vertex( xLB_6, yLB_6, zLB_6);
vertex( xLB_7, yLB_7, zLB_7);
vertex( xLB_e, yLB_e, zLB_e);
endShape();
}
//////// draw Great Bear ///////////
// draw point Great Bear
stroke(random(255));
strokeWeight(sw);
float xGB_1 = p * sin(radians(60)) * cos(radians(-106));
float yGB_1 = p * cos(radians(60));
float zGB_1 = p * sin(radians(60)) * sin(radians(-106));
point( xGB_1, yGB_1, zGB_1);
float xGB_2 = p * sin(radians(55)) * cos(radians(-110));
float yGB_2 = p * cos(radians(55));
float zGB_2 = p * sin(radians(55)) * sin(radians(-110));
point( xGB_2, yGB_2, zGB_2);
float xGB_3 = p * sin(radians(52)) * cos(radians(-113));
float yGB_3 = p * cos(radians(52));
float zGB_3 = p * sin(radians(52)) * sin(radians(-113));
point( xGB_3, yGB_3, zGB_3);
float xGB_4 = p * sin(radians(51)) * cos(radians(-115.5));
float yGB_4 = p * cos(radians(51));
float zGB_4 = p * sin(radians(51)) * sin(radians(-115.5));
point( xGB_4, yGB_4, zGB_4);
float xGB_5 = p * sin(radians(46)) * cos(radians(-121.5));
float yGB_5 = p * cos(radians(46));
float zGB_5 = p * sin(radians(46)) * sin(radians(-121.5));
point( xGB_5, yGB_5, zGB_5);
float xGB_6 = p * sin(radians(51.5)) * cos(radians(-123.5));
float yGB_6 = p * cos(radians(51.5));
float zGB_6 = p * sin(radians(51.5)) * sin(radians(-123.5));
point( xGB_6, yGB_6, zGB_6);
float xGB_7 = p * sin(radians(54.5)) * cos(radians(-117.5));
float yGB_7 = p * cos(radians(54.5));
float zGB_7 = p * sin(radians(54.5)) * sin(radians(-117.5));
point( xGB_7, yGB_7, zGB_7);
float xGB_e = p * sin(radians(51)) * cos(radians(-115.5));
float yGB_e = p * cos(radians(51));
float zGB_e = p * sin(radians(51)) * sin(radians(-115.5));
point( xGB_e, yGB_e, zGB_e);
// draw Line
if (key == '2' || key =='5'){
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xGB_1, yGB_1, zGB_1);
vertex( xGB_2, yGB_2, zGB_2);
vertex( xGB_3, yGB_3, zGB_3);
vertex( xGB_4, yGB_4, zGB_4);
vertex( xGB_5, yGB_5, zGB_5);
vertex( xGB_6, yGB_6, zGB_6);
vertex( xGB_7, yGB_7, zGB_7);
vertex( xGB_e, yGB_e, zGB_e);
endShape();
}

///////// draw Cassiopeia /////////
// draw point Cassiopeia
stroke(random(255));
strokeWeight(sw);
float xCP_1 = p * sin(radians(30)) * cos(radians(80));
float yCP_1 = p * cos(radians(30));
float zCP_1 = p * sin(radians(30)) * sin(radians(80));
point( xCP_1, yCP_1, zCP_1);
float xCP_2 = p * sin(radians(35)) * cos(radians(75));
float yCP_2 = p * cos(radians(35));
float zCP_2 = p * sin(radians(35)) * sin(radians(75));
point( xCP_2, yCP_2, zCP_2);
float xCP_3 = p * sin(radians(34.5)) * cos(radians(70));
float yCP_3 = p * cos(radians(34.5));
float zCP_3 = p * sin(radians(34.5)) * sin(radians(70));
point( xCP_3, yCP_3, zCP_3);
float xCP_4 = p * sin(radians(40)) * cos(radians(67));
float yCP_4 = p * cos(radians(40));
float zCP_4 = p * sin(radians(40)) * sin(radians(67));
point( xCP_4, yCP_4, zCP_4);
float xCP_5 = p * sin(radians(37)) * cos(radians(60));
float yCP_5 = p * cos(radians(37));
float zCP_5 = p * sin(radians(37)) * sin(radians(60));
point( xCP_5, yCP_5, zCP_5);
// draw Line
if (key=='3' || key == '5'){
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xCP_1, yCP_1, zCP_1);
vertex( xCP_2, yCP_2, zCP_2);
vertex( xCP_3, yCP_3, zCP_3);
vertex( xCP_4, yCP_4, zCP_4);
vertex( xCP_5, yCP_5, zCP_5);
endShape();
}
///////// draw Orion //////////
// draw point Orion Body
stroke(random(255));
strokeWeight(sw);
float xOR_1 = p * sin(radians(65)) * cos(radians(150));
float yOR_1 = p * cos(radians(65));
float zOR_1 = p * sin(radians(65)) * sin(radians(150));
point( xOR_1, yOR_1, zOR_1);
float xOR_2 = p * sin(radians(68)) * cos(radians(162));
float yOR_2 = p * cos(radians(68));
float zOR_2 = p * sin(radians(68)) * sin(radians(162));
point( xOR_2, yOR_2, zOR_2);
float xOR_3 = p * sin(radians(56)) * cos(radians(158));
float yOR_3 = p * cos(radians(56));
float zOR_3 = p * sin(radians(56)) * sin(radians(158));
point( xOR_3, yOR_3, zOR_3);
float xOR_4 = p * sin(radians(55)) * cos(radians(156));
float yOR_4 = p * cos(radians(55));
float zOR_4 = p * sin(radians(55)) * sin(radians(156));
point( xOR_4, yOR_4, zOR_4);
float xOR_5 = p * sin(radians(54)) * cos(radians(154));
float yOR_5 = p * cos(radians(54));
float zOR_5 = p * sin(radians(54)) * sin(radians(154));
point( xOR_5, yOR_5, zOR_5);
float xOR_6 = p * sin(radians(45)) * cos(radians(152));
float yOR_6 = p * cos(radians(45));
float zOR_6 = p * sin(radians(45)) * sin(radians(152));
point( xOR_6, yOR_6, zOR_6);
float xOR_7 = p * sin(radians(40.5)) * cos(radians(155));
float yOR_7 = p * cos(radians(40.5));
float zOR_7 = p * sin(radians(40.5)) * sin(radians(155));
point( xOR_7, yOR_7, zOR_7);
float xOR_8 = p * sin(radians(42.5)) * cos(radians(163));
float yOR_8 = p * cos(radians(42.5));
float zOR_8 = p * sin(radians(42.5)) * sin(radians(163));
point( xOR_8, yOR_8, zOR_8);
// draw point Orion left arm
float xOR_9 = p * sin(radians(40.5)) * cos(radians(166));
float yOR_9 = p * cos(radians(40.5));
float zOR_9 = p * sin(radians(40.5)) * sin(radians(166));
point( xOR_9, yOR_9, zOR_9);
float xOR_10 = p * sin(radians(35.5)) * cos(radians(168));
float yOR_10 = p * cos(radians(35.5));
float zOR_10 = p * sin(radians(35.5)) * sin(radians(168));
point( xOR_10, yOR_10, zOR_10);
float xOR_11 = p * sin(radians(36.5)) * cos(radians(170));
float yOR_11 = p * cos(radians(36.5));
float zOR_11 = p * sin(radians(36.5)) * sin(radians(170));
point( xOR_11, yOR_11, zOR_11);
float xOR_12 = p * sin(radians(29.5)) * cos(radians(163));
float yOR_12 = p * cos(radians(29.5));
float zOR_12 = p * sin(radians(29.5)) * sin(radians(163));
point( xOR_12, yOR_12, zOR_12);
float xOR_13 = p * sin(radians(30)) * cos(radians(168));
float yOR_13 = p * cos(radians(30));
float zOR_13 = p * sin(radians(30)) * sin(radians(168));
point( xOR_13, yOR_13, zOR_13);

// draw point Orion right arm
float xOR_14 = p * sin(radians(40.5)) * cos(radians(141));
float yOR_14 = p * cos(radians(40.5));
float zOR_14 = p * sin(radians(40.5)) * sin(radians(141));
point( xOR_14, yOR_14, zOR_14);
float xOR_15 = p * sin(radians(42)) * cos(radians(140));
float yOR_15 = p * cos(radians(42));
float zOR_15 = p * sin(radians(42)) * sin(radians(140));
point( xOR_15, yOR_15, zOR_15);
float xOR_16 = p * sin(radians(44)) * cos(radians(140));
float yOR_16 = p * cos(radians(44));
float zOR_16 = p * sin(radians(44)) * sin(radians(140));
point( xOR_16, yOR_16, zOR_16);
float xOR_17 = p * sin(radians(45.5)) * cos(radians(140.5));
float yOR_17 = p * cos(radians(45.5));
float zOR_17 = p * sin(radians(45.5)) * sin(radians(140.5));
point( xOR_17, yOR_17, zOR_17);
float xOR_18 = p * sin(radians(49)) * cos(radians(141));
float yOR_18 = p * cos(radians(49));
float zOR_18 = p * sin(radians(49)) * sin(radians(141));
point( xOR_18, yOR_18, zOR_18);
float xOR_19 = p * sin(radians(50)) * cos(radians(142));
float yOR_19 = p * cos(radians(50));
float zOR_19 = p * sin(radians(50)) * sin(radians(142));
point( xOR_19, yOR_19, zOR_19);
if (key == '4' || key == '5'){
// draw Line about Orion Body
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xOR_5, yOR_5, zOR_5);
vertex( xOR_1, yOR_1, zOR_1);
vertex( xOR_2, yOR_2, zOR_2);
vertex( xOR_3, yOR_3, zOR_3);
vertex( xOR_4, yOR_4, zOR_4);
vertex( xOR_5, yOR_5, zOR_5);
vertex( xOR_6, yOR_6, zOR_6);
vertex( xOR_7, yOR_7, zOR_7);
vertex( xOR_8, yOR_8, zOR_8);
vertex( xOR_3, yOR_3, zOR_3);
endShape();

// draw Line about Orion left arm
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xOR_8, yOR_8, zOR_8);
vertex( xOR_9, yOR_9, zOR_9);
vertex( xOR_10, yOR_10, zOR_10);
vertex( xOR_11, yOR_11, zOR_11);
vertex( xOR_9, yOR_9, zOR_9);
endShape();
beginShape();
line(xOR_12, yOR_12, zOR_12, xOR_10, yOR_10, zOR_10 ); 
line(xOR_11, yOR_11, zOR_11, xOR_13, yOR_13, zOR_13 );
endShape();

// draw Line about Orion right arm
beginShape();
stroke(#5D63FA);
strokeWeight(1);
vertex( xOR_14, yOR_14, zOR_14);
vertex( xOR_15, yOR_15, zOR_15);
vertex( xOR_16, yOR_16, zOR_16);
vertex( xOR_17, yOR_17, zOR_17);
vertex( xOR_18, yOR_18, zOR_18);
vertex( xOR_19, yOR_19, zOR_19);
endShape();
line(xOR_16, yOR_16, zOR_16, xOR_6, yOR_6, zOR_6);
}
popMatrix(); // load coordinates system
////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////// draw stars ///////////////////////////////////////
for (float pi_1 = 0; pi_1 < 90; pi_1 += 1)
{
float theta_1 = radians(random(360));
float x1 = p * sin(pi_1) * cos(theta_1);
float y1 = p * sin(pi_1) * sin(theta_1);
float z1 = p * cos(pi_1);
stroke(random(255));
strokeWeight(5);
point(x1,y1,z1);
}
///////////////////////////////////////////////////////////////////////////////
//draw body
if (mouseY<=740) {
stroke(#FC2814);
strokeWeight(3); 
for (float y_b = 400; y_b < r_h; y_b +=5)
{
float r_c = y_b/25;
for ( float deg_t = 0; deg_t < 360; deg_t +=delta)
{
float theta_t = radians(deg_t);
float x_b = r_c * cos(theta_t);
float z_b = r_c * sin(theta_t);
point(x_b, y_b - tY + height/2 , z_b);
}
}
}
//draw head
if (mouseY<=740) {
stroke(#FC2814);
strokeWeight(2); 
for (float pi_f = 0; pi_f < 360; pi_f += 5)
{
for(float deg_f = 0; deg_f <360; deg_f += delta)
{
float theta_f = radians(deg_f);
float xf = r_f * sin(pi_f) * cos(theta_f);
float yf = r_f * sin(pi_f) * sin(theta_f) + 250;
float zf = r_f * cos(pi_f);
point(xf,yf,zf);
}
}
}
// draw grass
if (count%2 == 1){
grass(); 
}
//draw surface
fill(#21710B);
noStroke();
if (mouseY<=611) {
beginShape();
for (float deg = 0; deg < 360; deg += 5) {
float theta = radians(deg);
float x = r * cos(theta);
float z = r * sin(theta); 
vertex(x, 0, z);
}
endShape(CLOSE);
}
}
void grass(){
float lx =0, ly = 0, lz = 1;
float[] x = new float[25];
float[] y = new float[25];
float[] z = new float[25];
float[] rx = new float[25];
float[] ry = new float[25];
float[] rz = new float[25];
float[] sx = new float[25];
float[] sy = new float[25];
float[] sz = new float[25];
float[] cx = new float[25];
float[] cy = new float[25];
float[] cz = new float[25]; 
float[] size = new float[25];
float[] brightness = new float[25];
for(int i =0; i<=15; i++){
x[i] = random(-1500,1500);
y[i] = random(30,60);
z[i] = random(-1500,1500);
rx[i] = random(-300, 300);
ry[i] = random(-400, 0);
rz[i] = random(-300, 300);
sx[i] = random(-300, 300);
sy[i] = random(-400, 0);
sz[i] = random(-300, 300);
cx[i] = (ry[i]*sz[i]-ry[i]*sy[i]);
cy[i] = -(rx[i]*sz[i]-rz[i]*sx[i]);
cz[i] = (rx[i]*sy[i]-ry[i]*sx[i]);
size[i] = sqrt(cx[i]*cx[i] + cy[i]*cy[i] + cz[i]*cz[i]);
cx[i] = cx[i]/size[i];
cy[i] = cy[i]/size[i];
cz[i] = cz[i]/size[i];
brightness[i] = abs(cx[i]*lx + cy[i]*ly + cz[i]*lz);

fill(0,brightness[i]*255,0);
stroke(#279B08);
beginShape();
vertex(x[i], y[i], z[i]);
vertex(x[i]+rx[i], y[i]+ry[i], z[i]+rz[i]);
vertex(x[i]+sx[i], y[i]+sy[i], z[i]+sz[i]);
endShape();
}
}
void mouseClicked(){
count++;
}


