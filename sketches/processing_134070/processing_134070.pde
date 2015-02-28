
Cell[] cell_1;
Cell[] cell_2;
Cell[] cell_3;
Cell[] cell_4;
Cell[] cell_5;
Cell[] cell_6;
Cell[] cell_7;
Cell[] cell_8;
Cell[] cell_9;
Cell[] cell_10;
Cell[] cell_11;
Cell[] cell_12;
Cell[] cell_13;
Cell[] cell_14;
Cell[] cell_15;
Cell[] cell_16;
Cell[] cell_17;
Cell[] cell_18;
Cell[] cell_19;
Cell[] cell_20;
Cell[] cell_21;
Cell[] cell_22;

boolean allCircle = false;

void setup() {

  size( 800, 600 );
  //frameRate();

  color chloroplastColor = #c4d134;
  int chloroplastNumber = 2;
  float chloroplastSpeed = random( 2, 8 );


  //first collumn
  cell_1 = new Cell[ 15*chloroplastNumber ];
  for (int i=0; i<cell_1.length; i++ ) {
    cell_1[i] = new Cell( 0, width*0.1, 0, height*0.6, chloroplastColor, chloroplastSpeed );
  }

  cell_2 = new Cell[ 6*chloroplastNumber ];
  for (int i=0; i<cell_2.length; i++ ) {
    cell_2[i] = new Cell( 0, width*0.1, height*0.6, height, chloroplastColor, chloroplastSpeed );
  }


  //second collumn
  cell_3 = new Cell[ 5*chloroplastNumber ];
  for (int i=0; i<cell_3.length; i++ ) {
    cell_3[i] = new Cell( width*0.1, width*0.2, 0, height*0.3, chloroplastColor, chloroplastSpeed );
  }

  cell_4 = new Cell[ 10*chloroplastNumber ];
  for (int i=0; i<cell_4.length; i++ ) {
    cell_4[i] = new Cell( width*0.1, width*0.2, height*0.3, height, chloroplastColor, chloroplastSpeed );
  }


  //third collumn
  cell_5 = new Cell[ 8*chloroplastNumber ];
  for (int i=0; i<cell_5.length; i++ ) {
    cell_5[i] = new Cell( width*0.2, width*0.3, 0, height*0.4, chloroplastColor, chloroplastSpeed );
  }

  cell_6 = new Cell[ 15*chloroplastNumber ];
  for (int i=0; i<cell_6.length; i++ ) {
    cell_6[i] = new Cell( width*0.2, width*0.3, height*0.4, height, chloroplastColor, chloroplastSpeed );
  }


  //fourth collumn
  cell_7 = new Cell[ 30*chloroplastNumber ];
  for (int i=0; i<cell_7.length; i++ ) {
    cell_7[i] = new Cell( width*0.3, width*0.4, 0, height*0.7, chloroplastColor, chloroplastSpeed );
  }

  cell_8 = new Cell[ 8*chloroplastNumber ];
  for (int i=0; i<cell_8.length; i++ ) {
    cell_8[i] = new Cell( width*0.3, width*0.4, height*0.7, height, chloroplastColor, chloroplastSpeed );
  }


  //fifth collumn
  cell_9 = new Cell[ 9*chloroplastNumber ];
  for (int i=0; i<cell_9.length; i++ ) {
    cell_9[i] = new Cell( width*0.4, width*0.5, 0, height*0.5, chloroplastColor, chloroplastSpeed );
  }

  cell_10 = new Cell[ 12*chloroplastNumber ];
  for (int i=0; i<cell_10.length; i++ ) {
    cell_10[i] = new Cell( width*0.4, width*0.5, height*0.5, height, chloroplastColor, chloroplastSpeed );
  }


  //sixth collumn
  cell_11 = new Cell[ 5*chloroplastNumber ];
  for (int i=0; i<cell_11.length; i++ ) {
    cell_11[i] = new Cell( width*0.5, width*0.6, 0, height*0.35, chloroplastColor, chloroplastSpeed );
  }

  cell_12 = new Cell[ 15*chloroplastNumber ];
  for (int i=0; i<cell_12.length; i++ ) {
    cell_12[i] = new Cell( width*0.5, width*0.6, height*0.35, height*0.9, chloroplastColor, chloroplastSpeed );
  }

  cell_13 = new Cell[ 2*chloroplastNumber ];
  for (int i=0; i<cell_13.length; i++ ) {
    cell_13[i] = new Cell( width*0.5, width*0.6, height*0.9, height, chloroplastColor, chloroplastSpeed );
  }


  //seventh collumn
  cell_14 = new Cell[ 6*chloroplastNumber ];
  for (int i=0; i<cell_14.length; i++ ) {
    cell_14[i] = new Cell( width*0.6, width*0.7, 0, height*0.45, chloroplastColor, chloroplastSpeed );
  }

  cell_15 = new Cell[ 10*chloroplastNumber ];
  for (int i=0; i<cell_15.length; i++ ) {
    cell_15[i] = new Cell( width*0.6, width*0.7, height*0.45, height, chloroplastColor, chloroplastSpeed );
  }


  //eigth collumn
  cell_16 = new Cell[ 10*chloroplastNumber ];
  for (int i=0; i<cell_16.length; i++ ) {
    cell_16[i] = new Cell( width*0.7, width*0.8, 0, height*0.2, chloroplastColor, chloroplastSpeed );
  }

  cell_17 = new Cell[ 7*chloroplastNumber ];
  for (int i=0; i<cell_17.length; i++ ) {
    cell_17[i] = new Cell( width*0.7, width*0.8, height*0.2, height*0.75, chloroplastColor, chloroplastSpeed );
  }

  cell_18 = new Cell[ 6*chloroplastNumber ];
  for (int i=0; i<cell_18.length; i++ ) {
    cell_18[i] = new Cell( width*0.7, width*0.8, height*0.75, height, chloroplastColor, chloroplastSpeed );
  }


  //ninth collumn
  cell_19 = new Cell[ 15*chloroplastNumber ];
  for (int i=0; i<cell_19.length; i++ ) {
    cell_19[i] = new Cell( width*0.8, width*0.9, 0, height*0.6, chloroplastColor, chloroplastSpeed );
  }

  cell_20 = new Cell[ 10*chloroplastNumber ];
  for (int i=0; i<cell_20.length; i++ ) {
    cell_20[i] = new Cell( width*0.8, width*0.9, height*0.6, height, chloroplastColor, chloroplastSpeed );
  }


  //tenth collumn
  cell_21 = new Cell[ 9*chloroplastNumber ];
  for (int i=0; i<cell_21.length; i++ ) {
    cell_21[i] = new Cell( width*0.9, width, 0, height*0.4, chloroplastColor, chloroplastSpeed );
  }

  cell_22 = new Cell[ 8*chloroplastNumber ];
  for (int i=0; i<cell_22.length; i++ ) {
    cell_22[i] = new Cell( width*0.9, width, height*0.4, height, chloroplastColor, chloroplastSpeed );
  }
}
//end setup


//begin draw
void draw() {

  background(255);

  //first collumn
  for (int i=0; i<cell_1.length; i++ ) { 
    cell_1[i].update(); 
    cell_1[i].display();
  }

  for (int i=0; i<cell_2.length; i++ ) { 
    cell_2[i].update(); 
    cell_2[i].display();
  }


  //second collumn
  for (int i=0; i<cell_3.length; i++ ) { 
    cell_3[i].update(); 
    cell_3[i].display();
  }

  for (int i=0; i<cell_4.length; i++ ) { 
    cell_4[i].update(); 
    cell_4[i].display();
  }


  //third collumn
  for (int i=0; i<cell_5.length; i++ ) { 
    cell_5[i].update(); 
    cell_5[i].display();
  }

  for (int i=0; i<cell_6.length; i++ ) { 
    cell_6[i].update(); 
    cell_6[i].display();
  }


  //fourth collumn
  for (int i=0; i<cell_7.length; i++ ) { 
    cell_7[i].update(); 
    cell_7[i].display();
  }

  for (int i=0; i<cell_8.length; i++ ) { 
    cell_8[i].update(); 
    cell_8[i].display();
  }


  //fifth collumn
  for (int i=0; i<cell_9.length; i++ ) { 
    cell_9[i].update(); 
    cell_9[i].display();
  }

  for (int i=0; i<cell_10.length; i++ ) { 
    cell_10[i].update(); 
    cell_10[i].display();
  }


  //sixth collumn
  for (int i=0; i<cell_11.length; i++ ) { 
    cell_11[i].update(); 
    cell_11[i].display();
  }

  for (int i=0; i<cell_12.length; i++ ) { 
    cell_12[i].update(); 
    cell_12[i].display();
  }

  for (int i=0; i<cell_13.length; i++ ) { 
    cell_13[i].update(); 
    cell_13[i].display();
  }


  //seventh collumn
  for (int i=0; i<cell_14.length; i++ ) { 
    cell_14[i].update(); 
    cell_14[i].display();
  }

  for (int i=0; i<cell_15.length; i++ ) { 
    cell_15[i].update(); 
    cell_15[i].display();
  }


  //eigth collumn
  for (int i=0; i<cell_16.length; i++ ) { 
    cell_16[i].update(); 
    cell_16[i].display();
  }

  for (int i=0; i<cell_17.length; i++ ) { 
    cell_17[i].update(); 
    cell_17[i].display();
  }

  for (int i=0; i<cell_18.length; i++ ) { 
    cell_18[i].update(); 
    cell_18[i].display();
  }


  //ninth collumn
  for (int i=0; i<cell_19.length; i++ ) { 
    cell_19[i].update(); 
    cell_19[i].display();
  }

  for (int i=0; i<cell_20.length; i++ ) { 
    cell_20[i].update(); 
    cell_20[i].display();
  }


  //tenth collumn
  for (int i=0; i<cell_21.length; i++ ) { 
    cell_21[i].update(); 
    cell_21[i].display();
  }

  for (int i=0; i<cell_22.length; i++ ) { 
    cell_22[i].update(); 
    cell_22[i].display();
  }
}
//end draw

void mouseClicked() {
  allCircle = !allCircle;
}

class Cell {

  //global data
  PVector position;
  PVector velocity;

  float minX;
  float maxX;
  float minY;
  float maxY;

  color chlorColor;
  float chlorSpeed;

  int edgeBuffer = 15;

  int chloroplastWidth = 15;
  int chloroplastHeight = 15;
  //end global data


  //constructor
  Cell( float inX1, float inX2, float inY1, float inY2, color inFillColor, float inSpeed  ) {

    minX = inX1;
    maxX = inX2;
    minY = inY1;
    maxY = inY2;

    chlorColor = inFillColor;
    chlorSpeed = inSpeed;

    position = new PVector( random(minX+10, maxX-10), random(minY+10, maxY-10) );
    velocity = new PVector( 0, 0 );
  }
  //end constructor


  //update
  void update() {

    if ( allCircle==false ) {
      if ( mouseX>minX && mouseX<maxX && mouseY>minY && mouseY<maxY) {
        circle();
      }

      else {
        bob();
      }
    }

    if ( allCircle==true ) {
      circle();
    }

    position.add(velocity);
  }
  //end update


  //circle movement
  void circle() {
    float cellCenterX = minX+((maxX - minX)/2);
    float cellCenterY = minY+((maxY - minY)/2);
    float repellX = position.x - cellCenterX;
    float repellY = position.y - cellCenterY;
    PVector force = new PVector( repellX/60, repellY/60 );
    velocity.add( force );
    velocity.setMag( chlorSpeed );

    if ( position.x > maxX-edgeBuffer ) {
      PVector adjustment = new PVector( -1, 0);
      position.add( adjustment );
      velocity.set( 0, 5 );
    }

    if ( position.y > maxY-edgeBuffer ) {
      PVector adjustment = new PVector( 0, -1);
      position.add( adjustment );
      velocity.set( -5, 0 );
    }

    if ( position.x < minX+edgeBuffer ) {
      PVector adjustment = new PVector( 5, 0 );
      position.add( adjustment );
      velocity.set( 0, -5 );
    }

    if ( position.y < minY+edgeBuffer ) {
      PVector adjustment = new PVector( 0, 1);
      position.add( adjustment );
      velocity.set( 1, 0 );
    }
  }
  //end circle movement



  //bob movement
  void bob() {
    PVector force = new PVector( random(-2, 2), random(-2, 2) );
    velocity.limit(3);
    velocity.add( force );

    if ( position.x > maxX-edgeBuffer ) {
      position.x = position.x - 1;
      velocity.x = velocity.x*-1;
    }

    if ( position.y > maxY-edgeBuffer ) {
      position.y = position.y - 1;
      velocity.y = velocity.y*-1;
    }

    if ( position.x < minX+edgeBuffer ) {
      position.x = position.x + 1;
      velocity.x = velocity.x*-1;
    }

    if ( position.y < minY+edgeBuffer ) {
      position.y = position.y + 1;
      velocity.y = velocity.y*-1;
    }
  }
  //end bob movement


  //display
  void display() {

    float rectWidth = maxX-minX;
    float rectHeight = maxY-minY;
    int cornerRadius = 10;

    fill(255, 0);
    stroke(#555935);
    strokeWeight(1);
    rect( minX, minY, rectWidth, rectHeight, cornerRadius);
    stroke(#fafae1, 200);
    strokeWeight(6);
    rect( minX, minY, rectWidth, rectHeight, cornerRadius);

    fill( chlorColor, 200 );
    noStroke();
    ellipse( position.x, position.y, chloroplastWidth, chloroplastHeight );
  }
  //end display
}
//end class



