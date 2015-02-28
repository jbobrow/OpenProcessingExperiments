
void setup(){
  size(3000,800);
  String[]data = loadStrings("earthquakecsv.txt");
  for(int i=1;i<data.length;i++){
    String[]pieces=split(data[i],",");
    float x=parseFloat(pieces[6]);
    float y=parseFloat(pieces[7]);
    println(pieces[6]+ ":" +pieces[7]);
    ellipse(x+800,y+300,10,10);
    if(i%5==0){
      text(pieces[11],x+800,y+300);
    }
  }
}

