
String[] names = {"ARTD 350", "ARTD 361", "ARTD 395", "ARTD 416"};

void setup(){
size(400, 400);
println(names);
}
void draw(){
  if (mousePressed == true){

    background(205);
textSize(20);
int w = int(random(names.length));
fill(0, 0, 255);
text(names[w], random(300), random(400));
int x = int(random(names.length));
fill(0, 255, 0);
text(names[x], random(300), random(400));
int y = int(random(names.length));
fill(255, 0, 0);
text(names[y], random(300), random(400));
int z = int(random(names.length));
fill(255, 255, 0);
text(names[z], random(300), random(400));
}}

