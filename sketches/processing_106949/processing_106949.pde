
float x=10.0,y=10.0,dx=1.0,dy=1.0,mousePressed=0.0;
float xdummy=0.0, ydummy=0.0;
int count=-1, countLimit=0;
float[] addx = new float[999];
float[] addy = new float{999];
float[] adddx = new float[999];
float[] adddy = new float[999];

PFont f; //define font

void setup() {
    size (500,500);
    println("Initialise");
    f = createFont("Calibri",8,true); //Init font

    for (int init=0;init<=999;init++) { //initialise array of x values
        addx[init]=10;
        addy[init]=10;
        adddx[init]=random(5.0);
        adddy[init]=random(5.0);
    }
}

void mouseReleased() { // increase max no. of additional balls
  countLimit++;
}

void draw() {
    background(255,255,255); //set background

    fill (0,0,0);
    rect (225,200,50,100); // create and fill rectangle in middle

    fill (0,255,0);
    ellipse(x,y,20.0,20.0); // create and fill circle

    x += dx; //update ellip x-pos
    y += dy; //update ellip y-pos

    if (x > 490.0 || x < 10.0) { //boundary deflect x-plane
        dx=-dx;
    }
    if (y > 490.0 || y < 10.0) { //boundary deflect y-plane
        dy=-dy; 
    }

    if (((x>=215.0&&x<=225.0)&&(y>=200.0&&y<=300.0))) dx=-dx; //left wall rebound
    if (((x>=275.0&&x<=285.0)&&(y>=200.0&&y<=300.0))) dx=-dx; //right wall rebound
    if (((x>=225.0&&x<=275.0)&&(y>=190.0&&y<=200.0))) dy=-dy; //top wall rebound
    if (((x>=225.0&&x<=275.0)&&(y>=300.0&&y<=310.0))) dy=-dy; //bottom wall rebound

    if (mousePressed) { //initialise new ball with mouseclick
        if (count<countLimit) count++; //only allow 1 ball to be created per mouseclick, regardless of length
        addx[count]=mouseX;
        addy[count]=mouseY;
    }
    
    if (count >=0) { //update positions of additional balls
        for (int addBallUpdate=0;addBallUpdate<=count;addBallUpdate++) {
        fill (random(255),random(255),random(255));
        ellipse(addx[addBallUpdate],addy[addBallUpdate],16,16);
        addx[addBallUpdate] += adddx[addBallUpdate];
        addy[addBallUpdate] += adddy[addBallUpdate];
        
            if (addx[addBallUpdate] > 492.0 || addx[addBallUpdate] < 8.0) { //boundary deflect x-plane
                adddx[addBallUpdate] =-adddx[addBallUpdate] ;
            }
            if (addy[addBallUpdate] > 492.0 || addy[addBallUpdate] < 8.0) { //boundary deflect y-plane
                adddy[addBallUpdate] =-adddy[addBallUpdate];
            }
            
        if (((addx[addBallUpdate]>=215.0&&addx;[addBallUpdate]<=225.0)&&(addy[addBallUpdate]>=200.0&&addy;[addBallUpdate]<=300.0))) adddx[addBallUpdate] =-adddx[addBallUpdate]; //left wall rebound
        if (((addx[addBallUpdate]>=275.0&&addx;[addBallUpdate]<=285.0)&&(addy[addBallUpdate]>=200.0&&addy;[addBallUpdate]<=300.0))) adddx[addBallUpdate] =-adddx[addBallUpdate]; //right wall rebound
        if (((addx[addBallUpdate]>=225.0&&addx;[addBallUpdate]<=275.0)&&(addy[addBallUpdate]>=190.0&&addy;[addBallUpdate]<=200.0))) adddy[addBallUpdate] =-adddy[addBallUpdate]; //top wall rebound
        if (((addx[addBallUpdate]>=225.0&&addx;[addBallUpdate]<=275.0)&&(addy[addBallUpdate]>=300.0&&addy;[addBallUpdate]<=310.0))) adddy[addBallUpdate] =-adddy[addBallUpdate]; //bottom wall rebound
            
        for (int checkCollision=0;checkCollision<=count;checkCollision++) {
            if (checkCollision != addBallUpdate) {
                if (addx[addBallUpdate] == addx[checkCollision]) {
                    adddx[addBallUpdate]=-adddx[addBallUpdate];
                    adddx[checkCollision]=-adddx[checkCollision];
                }
                if (addy[addBallUpdate] == addy[checkCollision]) {
                    adddx[addBallUpdate]=-adddx[addBallUpdate];
                    adddy[checkCollision]=-adddy[checkCollision];
                }
            }
        }  
           
            
        }
    }
    
    if (keyPressed) {
        fill(0,0,0);

        if (key=='d'&&(!(dx>=10))) dx += 1.0;
        else if (key=='w'&&(!(dy>=10))) dy+= 1.0;
        else if (key=='a'&&(!(dx>=-10))) dx-= 1.0;
        else if (key=='s'&&(!(dx>=-10))) dy-= 1.0;  
    }

      textFont(f,12);                 // Specify font to be used
      fill(0);                        // Specify font color 
      text("Pos: " + x + "," + y,430,496);  // Display position data
      text("Vel: " + dx + "," + dy,430,486); // Display velocity data
      text("Original Ball",430,476);
      text("# Balls: " + (count+2), 430, 466);
 

}
