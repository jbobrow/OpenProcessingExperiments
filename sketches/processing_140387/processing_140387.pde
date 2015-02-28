
int h =4;
int floorNum = 100/h;

//void setup() {
size(300, 1000);
background(0);
stroke(255);

//}

//void draw() {
for (int i=0;i<floorNum;i++) {
  if (i!=12&i!=2) {
    for (float j=0;j<width;j+=width/(4*(i+2)) ) {
      line(j+.5*width/(4*(i+2)), (25-i)*40, j+.5*width/(4*(i+2)), (24-i)*40);
    }
  }
}
int timestamp =month()*100000000+day()*1000000+hour()*10000+minute()*100+second(); 
println(timestamp);
String str = Integer.toString(timestamp);
println(str);
save(timestamp+".jpg");
//}

