
Pin[] pin = new Pin[26];
int[] brasil = {90,80,175,35,20,190,125,115,210,90,290,55,110,220,215,180,235,140,280,105,190,250,255,240,300,155,380,130,235,340,265,300,330,290,385,240,465,165,270,380,335,375,415,350,440,250,490,220,266,455,320,425};
int[][] conexao = new int[26][2];
String[] cores;
String call = "http://www.colourlovers.com/api/palettes/random?format=json";
JSONArray json;

void setup(){
  size(500,500);
}

void draw(){
  json = loadJSONArray(call);
  JSONArray arrCores = json.getJSONObject(0).getJSONArray("colors");
  cores = new String[arrCores.size()];
  for(int i = 0; i < arrCores.size(); i++){
    cores[i] = "FF" + arrCores.getString(i);
  }
  background(255,255,255);
  for(int i = 0; i < pin.length; i++){
    if(i == 0){
      pin[i] = new Pin(brasil[i], brasil[i+1], int(random(40)),cores);
      conexao[i][0] = brasil[i];
      conexao[i][1] = brasil[i+1];
    }else{
      pin[i] = new Pin(brasil[i*2], brasil[i*2+1], int(random(40)),cores);
      conexao[i][0] = brasil[i*2];
      conexao[i][1] = brasil[i*2+1];
    }
    for(int j = 0; j < pin.length; j++){
      stroke(unhex(cores[int(random(cores.length))]));
      line(conexao[i][0],conexao[i][1],conexao[j][0],conexao[j][1]);
    }
    pin[i].construir();
  }

}

class Pin{
  int x,y,diam;
  String[] cores;
  
  Pin(int tempX, int tempY, int tempDiam, String[] tempCores){
    x = tempX;
    y = tempY;
    diam = tempDiam;
    cores = tempCores;
  }
  
  void construir(){
    int randomValue = cores.length;
    noStroke();
    fill(unhex(cores[int(random(cores.length))]));
    ellipse(x,y,diam,diam);
  }
  
}
