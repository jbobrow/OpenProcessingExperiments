
float[] xpositions= new float[6];
float[] ypositions= new float[6];
float[] xvel=new float[6];
float[] yvel=new float[6];

void setup() {
  size(300, 300);
  background(0);

  xpositions[0] = 45;
  xpositions[1] = 19;
  xpositions[2] = 37;
  xpositions[3] = 4;
  xpositions[4] = 12;
  xpositions[5] = 55;

  ypositions[0] = 73;
  ypositions[1] = 39;
  ypositions[2] = 24;
  ypositions[3] = 88;
  ypositions[4] = 67;
  ypositions[5] = 5;


  for (int i=0; i<6;i++) {
    xvel[i]=random(-3, 3);
  }

  for (int i=0; i<6;i++) {
    yvel[i]=random(-3, 3);
  }
}

void draw() {
  background(0);

  for (int i=0; i<6; i++) {
    line(xpositions[i], random(100), random(100), ypositions[1]);
  }

  for (int i=0;i<6; i++) {
    xpositions[i]=xpositions[i]+xvel[i];
  }

  for (int i=0;i<6;i++) {
    ypositions[i]=ypositions[i]+yvel[i];
  }
  for (int i=0;i<6;i++) {
    if (xpositions[i]<13==true||xpositions[i]>287==true) {
      xvel[i]=xvel[i]*(-1);
    }
  }
  for (int i=0; i<6; i++) {
    if (ypositions[i]<13==true||ypositions[i]>287==true) {
      yvel[i]=yvel[i]*(-1);
    }
  }
  
  for(int i=0; i<6;i++){
    for(int k=0; k<6;k++){
      if(i!=k){
        if(dist(xpositions[i], ypositions[i], xpositions[k], ypositions[k])<10){
          xvel[i]*=-1;
          yvel[i]*=-1;
}
      }}}
    
  




  for (int i=0; i<6; i++) {
    stroke(random(255), random(255), random(255));
    line(random(100,200), ypositions[i], xpositions[i], random(100,200));
  }

  for (int i=0;i<6; i++) {
    xpositions[i]=xpositions[i]+xvel[i];
  }

  for (int i=0;i<6;i++) {
    ypositions[i]=ypositions[i]+yvel[i];
  }
  for (int i=0;i<6;i++) {
    if (xpositions[i]<13==true||xpositions[i]>287==true) {
      xvel[i]=xvel[i]*(-1);
    }
  }
  for (int i=0; i<6; i++) {
    if (ypositions[i]<13==true||ypositions[i]>287==true) {
      yvel[i]=yvel[i]*(-1);
    }
  }
  
  for(int i=0; i<6;i++){
    for(int k=0; k<6;k++){
      if(i!=k){
        if(dist(xpositions[i], ypositions[i], xpositions[k], ypositions[k])<10){
          xvel[i]*=-1;
          yvel[i]*=-1;
}
      }}
    }







}

