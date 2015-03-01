
void setup()
{
    println("20 + 5 = " + addiere(20, 5));
    
    int ergebnis = subtrahiere(15,30);
    println("15 - 30 = " + ergebnis);
    
    println("6 * 8 = " + multipliziere(6, 8));
    
    
    println("20 / 3 = " + dividiere(20, 3));
}

int addiere(int zahl1, int zahl2)
{
  return zahl1+zahl2;
}

int subtrahiere(int zahl1, int zahl2)
{
    return zahl1-zahl2;
}

int multipliziere(int zahl1, int zahl2)
{
     int ergebnis = zahl1 * zahl2;
     return ergebnis;
}

double dividiere(double zahl1, double zahl2)
{
    double ergebnis = zahl1 / zahl2;
    return ergebnis;
}
