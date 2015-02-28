
int[] years = new int[6];
float[] frenchFriesEaten = {
  23, 204.4, 103.3, 120.4, 50.1, 240.4901
};
void setup() {
  size(300, 350);
  for (int i = 0; i<years.length; i++) {
    years[i] = 1980 + i;
  }
}
void draw() {
background(200);
  for (int i = 0; i<frenchFriesEaten.length; i++) {
    fill(255, 255, 0);
    rect(10 + (i * 40), 60, 20, frenchFriesEaten[i]);
    fill(0);
    text(years[i], 10 + (i * 40), 30);
  }
}
