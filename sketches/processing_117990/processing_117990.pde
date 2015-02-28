
void setup(){
  size(600,600);
  background(255);
  fill(0);
  String lines[] = loadStrings("list.csv");
println("there are " + lines.length + " lines");
for (int i = 0 ; i < lines.length; i++) {
  text((i+1)+". "+lines[i], 50, i*50+50);
}
}


