
void setup(){
size(250,250);
}
void draw ()
{

background(#000000);
stroke(225);
strokeWeight(3);

line(mouseX, 90, pmouseX, 120);
line(mouseX, 120, pmouseX, 150);
line(mouseX, 150, pmouseX, 200);

noStroke();
fill(#AA4AA4);
rect(0,1,35,35);
fill(#448EA0);
rect(0,31,35,35);
fill(#AA4AA4);
rect(0,61,35,35);
fill(#448EA0);
rect(0,91,35,35);
fill(#AA4AA4);
rect(0,121,35,35);
fill(#448EA0);
rect(0,151,35,35);
fill(#AA4AA4);
rect(0,181,35,35);
fill(#448EA0);
rect(0,211,35,35);

fill(#AA4AA4);
rect(214,1,92,32);
fill(#448EA0);
rect(214,31,92,32);
fill(#AA4AA4);
rect(214,61,92,32);
fill(#448EA0);
rect(214,91,92,32);
fill(#AA4AA4);
rect(214,120,92,32);
fill(#448EA0);
rect(214,150,92,32);
fill(#AA4AA4);
rect(214,180,92,32);
fill(#448EA0);
rect(214,210,92,32);

}


