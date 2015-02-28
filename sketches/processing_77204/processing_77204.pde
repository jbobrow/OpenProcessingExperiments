
PFont font;
XMLElement xml;
void setup(){
  background(0);
  size(800,800);
  frameRate(100);
  println(height/(width/st.length));
  stWk = new String[st.length][height/( height/st.length)];
  j = st.length;
  font = createFont("メイリオ",48);
  textFont(font);
  textSize(width/st.length);
  textAlign(CENTER,CENTER);
  initSt();
  //rectMode(CENTER);
  xmlInput();
}
String [] xmlText;
void xmlInput(){
  xml = new XMLElement(this,"xml");
  XMLElement []child = xml.getChildren("status");
  println(child.length);
  int i=0;
  xmlText = new String[child.length];
  for(XMLElement ch : child){
    xmlText[i] =  ch.getChild("text").getContent();
    i++;
  }
  //this.stop();
}

void initSt(){
  st[0]="な";
  st[1]="ん";
  st[2]="か";
  st[3]="キ";
  st[4]="ー";
  st[5]="押";
  st[6]="し";
  st[7]="て";
  st[8]="!!";
  for(int i = 9;i<st.length;i++)st[i]="";
}
//あれ？
String [] st = new String[40];
String [][]stWk;
int i = 0;
void draw(){
  background(255);
  println(i+" "+j);
  shiftMozi();
  dispmozi();
  dispMozi();
  sort1();
}
int j;
void sort1(){
    if(j>i+1){
      j--;
      String wk;
      if(st[j-1].compareTo(st[j])>0){
        wk = st[j];
        st[j] = st[j-1];
        st[j-1] = wk;
      }
    }else{
      if(i<st.length)i++;
      j = st.length;
    }
}

void shiftMozi(){
  for(int idx = st.length-1; idx > 0 ;idx--){
    stWk[idx] = stWk[idx-1].clone();
  }
    stWk[0] = st;
}
boolean colSw = true;
void dispMozi(){
  int endX = stWk.length;
  int endY = stWk[0].length;
  int c ;
  for(int i2 =0; i2< endY ;i2++){
      if(colSw){
        c=50;
        colSw=false;
      }else{
        c=30;
        colSw=true;
      } 
    for(int j = 0;j<endX;j++){
      fill(c);
      rect(j*width/endX,i2*height/endY,width/endX,height/endY);
      fill(255);
      if(stWk[i2][j]!=null)
      text(stWk[i2][j],j*width/endX+((width/endX)/2),i2*height/endY+(height/endY/4));
    }
  }
}
void dispmozi(){
  for(String s :st){
    print(s+"");
  }
  println();
  for(int i2 =0; i2<stWk.length;i2++){
    for(String s:stWk[i2]){
      print(s+"");
    }
    println("");
  }
}
boolean kpSw = true;
void keyPressed(){
  //String str1_1[] = loadStrings("http://api.twitter.com/1/lists/statuses.xml?slug=oto-mad-creator&owner_screen_name=Co_P");
  String str1 = "        "; 
  str1 = xmlText[(int(random(xmlText.length))%xmlText.length)];
  for(int i = str1.length()-1;i<st.length;i++) str1+=" ";
  for(int i = 0;i<st.length;i++){
   st[i] = str1.substring(i,i+1);
  }
  i=0;
  j=st.length;
  if(kpSw)kpSw=false;
}


