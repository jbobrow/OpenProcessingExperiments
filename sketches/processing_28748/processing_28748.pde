
// Bredde og højde på den færdige grafik
int bredde = 800;
int hoejde = 400;

// Maksimal og minimal bredde og højde på brikker
float brikMaxBredde = 30.0;
float brikMaxHoejde = 30.0;
float brikMinBredde = 2.0;
float brikMinHoejde = 2.0;

// Kolonne effekten skal ske i
int xAimAt = 28;
int yAimAt = 8;

// Diverse andre variabler
float xPos = 0; // Holder styr på den aktuelle bredde i pixels
float yPos = 0; // Holder styr på den aktuelle højde i pixels
int i = 0; // Nummeret på kolonnen
int j = 0; // Nummeret på rækken

void setup() {
  size(bredde,hoejde);
  smooth();
  noStroke();
}

void draw() {
  float aktuelBredde = 0;
  float aktuelHoejde = 0;
  while(xPos < bredde) {
    aktuelBredde = brikMinBredde + (min(abs(xAimAt - i),brikMaxBredde));
    while(yPos < hoejde) {
      aktuelHoejde = brikMinHoejde + (min(abs(yAimAt - j),brikMaxHoejde));
      color f = ((i+j)%2==1) ? #000066 : #ffffcc;
      fill(f);
      rect(xPos, yPos, aktuelBredde, aktuelHoejde);
      yPos += aktuelHoejde;
      j++;
    }
    yPos = 0;
    j = 0;
    xPos += aktuelBredde;
    i++;
  }
  xPos = 0;
  i = 0;
  noLoop();
}
