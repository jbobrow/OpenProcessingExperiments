
//Tank game, move tank with keys W, A, S, D, move turret and shoot with mouse. Later add enemies/targets.
 

 
float angle = radians(0); 
float x = 300;
float y = 300; 
float rotateSpeed = 0.01;
float speed = 1;
float up = 0;
float down = 0;
float left = 0;
float right = 0;
int tAngle = mouseX, mouseY;
 
int bulletOpacity = 0;
float bulletx = 312;
float bullety = 340;
float bulletAngle = 0;
boolean machineGun = false;
 
int cannonOpacity = 0;
float cannonx = 300;
float cannony = 440;
float cannonAngle = mouseX, mouseY;
boolean cannon = false;


PImage crosshair;

PImage tank;

PImage turret;

void setup() {  // this is run once.   
    size(600, 600);
     String crosshairurl = "http://i.imgur.com/PsBshNm.png";
     String tankurl = "http://i.imgur.com/zENFoat.png";
     String turreturl = "http://i.imgur.com/PsBshNm.png";
     // Load image from a web server
     crosshair = loadImage (crosshairurl, "png");
     tank = loadImage (tankurl, "png");
     turret = loadImage (turreturl, "png");
 
cursor(crosshair);
 
} 
 
void draw() {  // this is run repeatedly.  
 
background(0);
 
angle += rotateSpeed * (right - left);
x += cos(angle) * speed * (up - down); 
y += sin(angle) * speed * (up - down); 
 
if (cannon == true) {
    cannonOpacity = 100;
    cannonx += cos(cannonAngle) * 10;
    cannony += sin(cannonAngle) * 10;
}
 
if (machineGun == true) {
    bulletOpacity = 100;
    bulletx += cos(bulletAngle) * 10;
    bullety += sin(bulletAngle) * 10;
}
 
//Tank Body
pushMatrix(); 
    translate(x, y); 
    rotate(angle); 
    imageMode(CENTER);
    image(tank, 0, 0); 
popMatrix();
 
//Tank Turret
pushMatrix();
    translate(x, y);
    rotate(tAngle);
    imageMode(CENTER);
    image(turret, 20, 40);
popMatrix();
 
//Machine Gun Bullets
noStroke();
fill(255, 255, 255, bulletOpacity);
rect(bulletx, bullety, 3, 15);
fill(255, 255, 255, bulletOpacity);
rect(bulletx - 29, bullety, 3, 15);
 
//Cannon Round
fill(255, 0, 0, cannonOpacity);
ellipse(cannonx, cannony, 10, 30);
 
}
 
void keyPressed() {
    if (key == 'w') {
        up = 1;
    }
    if (key == 's') {
        down = 1;
    }
    if (key == 'd') {
        right = 1;
    }
    if (key == 'a') {
        left = 1;
    }
}
 
void keyReleased() {
    if (key == 'w') {
        up = 0;
    }
    if (key == 's') {
        down = 0;
    }
    if (key == 'd') {
        right = 0;
    }
    if (key == 'a') {
        left = 0;
    }
}
 
void mousePressed() {
    if (mouseButton == LEFT) {
        machineGun = true;
    }
    if (mouseButton == RIGHT) {
        cannon = false;
    }
}
 
void mouseReleased() {
    if (mouseButton == LEFT) {
        machineGun = false;
    }
    if (mouseButton == RIGHT) {
        cannon = true;
    }
}
 
