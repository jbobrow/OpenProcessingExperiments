
/*
__     __ ____    ____
\ \   / / |   \  /   | Victor M.
 \ \ / /  | |\ \/ /| | MIXED MEDIA ART
  \ V /   | | \  / | | 
   \ /    | |  \/  | | 
    V     |_|      |_| 

RGB Colock by Victor M.


*/




void setup(){
  size(500,585);
  background(0);
}

void draw(){
  colorMode(RGB,255);
  int sec = second(); 
  int min = minute();
  int hou = hour();
  int secCol = (sec*255)/60;
  int minCol = (min*255)/60;
  int houCol = (hou*255)/60;
  String []time = {"00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"};
  background(secCol, minCol, houCol);
  textSize(32);

  if(secCol > 200 || minCol > 200 || houCol > 200){
    fill(0);
  } else {
    fill(255);
  }
  text("Colock: RGB",2,36);
  text("R: "+secCol,2,36*2);
  text("G: "+minCol,2,36*3);
  text("B: "+houCol,2,36*4);
  text(hou+":"+time[min]+":"+time[sec],2,536);
}
