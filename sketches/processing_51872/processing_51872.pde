
public class Contract {
  float PointofSale = 0.0;
  public void Display() {
    strokeWeight(3);
    stroke(150,0,0);
    float derp1 = RealYMod(PointofSale*-1);
    if ((derp1>0)&&(derp1<height)) {
      line(0, derp1, width, derp1);
    }
  }
}

public class Longtract extends Contract{
  public Longtract(float derp){
    PointofSale = derp;
  }
}
  
public void Buy(int theValue) {
  if(Money>getCurrent()){
    Contracts.add(new Longtract(getCurrent()));
    Money -= getCurrent();
  }
//  println("You bought at " +getCurrent());
  Game2B.show();
  if(Scene==5){
    Scene++;
  }
}

public void Sell(int theValue) {
  for(Contract dip : Contracts){
    Money += (getCurrent()-dip.PointofSale)+dip.PointofSale;
  }
  Contracts.clear();
//  println("You Cashed in at " +getCurrent() +" and your new balance is $"+ Money);
  Game2B.hide();
  if(Scene==7){
    Scene++;
    Game3B.show();
  }
  Faded = 255;
  Bum();
}

