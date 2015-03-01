
float[] bargraph = new float[100];

void setup() {
  size(1000, 600);
  background(255);
  frameRate(5);

  for (int i = 0; i < bargraph.length; i++) {
    bargraph[i] = random(-100, 500);
    //    if (bargraph[i] <=0) {
    //      fill(255, 200, 200);
    //    } else if (bargraph[i] > 0 && bargraph[i] <= 100) {
    //      fill(200, 200, 200);
    //    } else if (bargraph[i] > 100 && bargraph[i] <= 200) {
    //      fill(150, 200, 200);
    //    } else if (bargraph[i] > 200 && bargraph[i] <= 300) {
    //      fill( 100, 200, 200);
    //    } else if (bargraph[i] > 300 && bargraph[i] <= 400) {
    //      fill( 50, 200, 200);
    //    } else if (bargraph[i] > 400 && bargraph[i] <= 500) {
    //      fill( 0, 200, 200);
    //    }
  }
}
void draw() {
  background(255);

  //BARGRAPH ONE
  for (int i = 0; i < bargraph.length; i++) {
    bargraph[i] = random(-100, 500);

    if (bargraph[i] <=0) {
      fill(255, 200, 200);
    } else if (bargraph[i] > 0 && bargraph[i] <= 100) {
      fill(200, 200, 200);
    } else if (bargraph[i] > 100 && bargraph[i] <= 200) {
      fill(150, 200, 200);
    } else if (bargraph[i] > 200 && bargraph[i] <= 300) {
      fill( 100, 200, 200);
    } else if (bargraph[i] > 300 && bargraph[i] <= 400) {
      fill( 50, 200, 200);
    } else if (bargraph[i] > 400 && bargraph[i] <= 500) {
      fill( 0, 200, 200);
    }
  }
  for (int i=0; i < bargraph.length; i++) {
    bargraph = sort(bargraph);
    bargraph = reverse(bargraph);
    rect(i*10, 500, 10, bargraph[i]*-1);
  }

  //BARGRAPH TWO
  for (int i = 0; i < bargraph.length; i++) {
    bargraph[i] = random(-75, 400);

    if (bargraph[i] <=0) {
      fill(255, 200, 200);
    } else if (bargraph[i] > 0 && bargraph[i] <= 100) {
      fill(200, 200, 100);
    } else if (bargraph[i] > 100 && bargraph[i] <= 200) {
      fill(150, 200, 100);
    } else if (bargraph[i] > 200 && bargraph[i] <= 300) {
      fill( 100, 200, 100);
    } else if (bargraph[i] > 300 && bargraph[i] <= 400) {
      fill( 50, 200, 100);
    } else if (bargraph[i] > 400 && bargraph[i] <= 500) {
      fill( 0, 200, 100);
    }
  }  
  for (int i=0; i < bargraph.length; i++) {
    bargraph = sort(bargraph);
    bargraph = reverse(bargraph);
    rect(i*10, 500, 10, bargraph[i]*-1);
  }
  //LINE GRAPH
  for (int i = 0; i < bargraph.length; i++) {
    bargraph[i] = random(-200, 500);
  }
  fill(0,0,0);
  for (int i=0; i < bargraph.length/4+1; i++) {
    bargraph = sort(bargraph);
    bargraph = reverse(bargraph);
    ellipse(i*40, bargraph[i], 10,10);
    stroke(1);
    line(i*40, bargraph[i], (i+1)*40, bargraph[i+1]);
  }

//VENN DIAGRAM

for (int i = 0; i < bargraph.length; i++) {
    bargraph[i] = random(100, 200);
  }
   for (int i=0; i < bargraph.length/20+1; i++) {
     colorMode(HSB);
     fill(i*20,200,200,bargraph[i]*1.2);
   ellipse(i*100+400, 200, bargraph[i], bargraph[i]);
   }
}



