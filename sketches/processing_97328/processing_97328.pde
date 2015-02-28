
//Monyse Takaki
//Alturas
void setup () {
  size (200, 200);
  background (0);
}

int [] largura = {
  10, 20, 30, 40, 50, 60
};
int [] altura = {
  50, 60, 70, 80, 90, 100
};

int i=100;
void draw() {

  for (int i=0; i< largura.length; i=i+1) {

    rect ( 20*i, 180, 15, -altura[i]);
    if (mouseX>100) {
      fill (255);
    } 
    else {

      fill (219, 20, 186);
    }
  }
}
