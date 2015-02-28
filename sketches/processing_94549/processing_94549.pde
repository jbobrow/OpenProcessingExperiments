
float r = 0;            //kąt obrotu inicjalizacja zmiennej i początkowa wartość 0

void setup() {          //wykonywane raz na początku programu
  size(600, 600, P3D);  //wielkość oraz renderer (nowe!)
  smooth();             //gładkie wyświetlanie krawędzi
}

void draw() {           //wykonywane co klatkę
  background(255);      //czyszczenie ekranu co klatkę
  translate(width/2, height/2, -100); //przesunięcie na środek ekranu i 100 px wgłąb
  fill(128);            //kolor szary
  box(100);             //sześcian o boku 100 px w środku układu odniesienia
  
  pushMatrix();         //zachowuje układ odniesienia
    rotateX(r);         //obrót wokół osi X o kąt r
    translate(0, 100, 0); //przesunięcie o 100 px wzdłuż (obróconej) osi Y
    fill(0, 255, 0);    //kolor
    box(20);            //sześcian o boku 20 px w środku układu odniesienia
  popMatrix();          //przywrócenie układu odniesienia z ostatniego pushMatrix()
  
  pushMatrix();
    rotateY(r);         //to samo wokół osi Y
    translate(0, 0, 100);  //przesunięcie - Z
    fill(255, 0, 0);
    box(20);
  popMatrix();
  
  pushMatrix();    
    rotateZ(r);         //to samo wokół osi Z
    translate(100, 0, 0);  //przesunięcie - X
    fill(0, 0, 255);
    box(20);
  popMatrix();
  
  r += 0.01;            //zwiększenie kąta obrotu o 0.01 radiana
}                       //na koniec klatki wszystkie transformacje znikają!
