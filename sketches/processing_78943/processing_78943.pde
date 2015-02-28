
size(400, 400);
background(255);
smooth();
noStroke();


//the data
float[] data = {
  16.4, 32.2, 44.1, 4.2, 2.1
};
colorMode(HSB,data.length);
float t = 0;

for (int i=0;i<data.length;i++) {
  t+=data[i];
}

// how much of each degree of the pie chart should each unit of data get
// in other words distributes our total data over 360 deg in preportion
t=360/t;

//two angles for each segment
float a1=0, a2=data[0];

//for each number in our data array
for (int i=0;i<data.length;i++) {

  // choose a random fill
  fill(i, 255, 255);
  //put the last leading angle into a2
  a2 = a1;
  //update the current leading angle
  a1 += data[i]*t;
  //print the angles for debuging purposes
  println(a1+"  :  "+a2);
  //draw teh arc
  arc(width/2, height/2, 300, 300, radians(a2), radians(a1));
}

for (int i=0;i<data.length;i++) {
  t+=data[i];
}
t=width/t;
int x=0, y=0;
for (int i=0;i<data.length;i++) {
  fill(i, 255, 255);
  rect(x, y, data[i]*t, 10);
  x+=(data[i]*t);
}


