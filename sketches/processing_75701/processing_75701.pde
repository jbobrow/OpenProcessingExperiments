
void setup() {
  size(1000,1000);
  background(185,245,239);
  textFont(createFont("Cubic", 20));
  text("I couldn't figure it out so I made it look pretty.",30,100);
  textFont(createFont("Cubic", 100));
  text("grade kindly.",200,900);

  String[] data=loadStrings("earthquakedata.tsv");
  for(int i = 1;i<data.length;i++){
    String[] pieces = split(data[i],",");
    float x=parseFloat(pieces[6]);
    float y=parseFloat(pieces[7]);
    println (pieces[6]=":" +pieces [7]);
    ellipse(x+200,y+500,1,400);
    text(pieces[11],x+200,y+500);  
}
}
