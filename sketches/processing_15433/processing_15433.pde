
class Particle {

  float lat;
  float lon;
  int energy;
  float direction;
  float pressure;
  float x;
  float y;
  float z;
  float x1;
  float y1;
  float z1;

  Particle(float lat_, float lon_, int energy_, float direction_, float pressure_, float x_, float y_, float z_, float x1_, float y1_, float z1_) {
    lat_ = lat;
    lon_ = lon;
    energy_ = energy;
    direction_ = direction;
    pressure_ = pressure;
    x_= x;
    y_= y;
    z_= z;
    x1_= x1;
    y1_= y1;
    z1_= z1;
  }

  void drawData() {

    //scale system according to mouse position
    float di = dist(width,height,width/2,height/2);
    float scaleAmt = map(di,0,636,.1,2.0);
    //scale(scaleAmt,scaleAmt,scaleAmt);

    //loop through data elements
    for (int i = 0; i<6594; i+=20) {
      float lon = dataDEC[i];  //y
      float lat = dataRA[i];  //x
      int energy = dataNRG[i];
      float direction = dataDIR[i];
      float pressure = dataPR[i];

      //convert degrees to radians
      float radLon = radians(lon); //y
      float radLat = radians(lat);  //x
      float radDir = radians(direction);
      //println(radLat);


      //first remap energy values
      float zPressure = map(pressure,714.0,764.8,-204,204);
      float zEnergy = map(energy,13,221,-100,100);

      //convert to spherical coordinates
      float p1 = (zEnergy) * sin(radLat) * cos(radLon);
      float p2 = (zEnergy) * sin(radLat) * sin(radLon);
      float p3 = (zEnergy) * cos(radLat);

      float m1 = (zPressure) * cos(radLat) * sin(radLon);
      float m2 = (zPressure) * cos(radLat) * cos(radLon);
      float m3 = (zPressure) * sin(radLat);

      float m = noise(i * .05, float(frameCount) * .05) * 20;

      //create neutrino points based on new spherical data coordinates
      //      stroke(255,255,255,100); //white
      //      beginShape(POINTS);
      //      vertex(p1 + m,p2 + m,p3 + m);
      //      endShape();


      //create neutron points based on new spherical data coordinates
      //      stroke(160,0,0); //red
      //      beginShape(POINTS);
      //      vertex(m1+m,m2+m,m3+m);
      //      endShape();

      //create proton based on previous two systems
      float L1 = p1 - m1;
      float L2 = p2 - m2;
      float L3 = p3 - m3;

      //      stroke(0,245,245,50); //cyan
      //      beginShape(POINTS);
      //      vertex(L1+m,L2+m,L3+m);
      //      endShape();

      //create electron based on previous two systems
      float n1 = m1 - L1;
      float n2 = m2 - L2;
      float n3 = m3 - L3;

      //      stroke(255,0,255,50); //pink
      //      beginShape(POINTS);
      //      vertex(n1+m,n2+m,n3+m);
      //      endShape();

      //create muon based on previous two systems
      float o1 = L1 - n1;
      float o2 = L2 - n2;
      float o3 = L3 - n3;

      //      stroke(160,190,200); //lavender
      //      beginShape(POINTS);
      //      vertex(o1+m,o2+m,o3+m);
      //      endShape();

      //create lines from neutrino to proton and neutrino to neutron
      stroke(255,255,255,100);
      line(p1+m,p2+m,p3+m,L1+m,L2+m,L3+m);
      line(p1+m,p2+m,p3+m,m1+m,m2+m,m3+m);

      //create lines from proton to electron and neutron to electron
      stroke(0,245,245,50);
      line(L1+m,L2+m,L3+m,n1+m,n2+m,n3+m);
      stroke(160,0,0,150);
      line(m1+m,m2+m,m3+m,n1+m,n2+m,n3+m);

      //create lines from electron to muon
      stroke(255,0,255,50);
      line(n1+m,n2+m,n3+m,o1+m,o2+m,o3+m);

      //move points based on their angular resolution
      dataDEC[i]=dataDEC[i]+radDir*10;
      dataRA[i]=dataRA[i]+radDir*10;
    }
  }
}


