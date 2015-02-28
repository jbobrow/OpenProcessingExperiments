
public class Crea      // Oggetto creazione del sistema di fontane composte da particelle
{
  private int count, life;      // Nº e vita delle particelle
  private PVector[] colours = new PVector[19];    // Array di colori per le 19 fontane
  private PVector[] origins = new PVector[19];    // Array della posizione per le 19 fontane
  private ParticleSystem[] pSystems = new ParticleSystem[19];    // 19 fontane
  
  Crea()
  {
    count = 100;
    life = 10;
    
    colours[0] = new PVector(51, 204, 255);
    colours[1] = new PVector(51, 255, 0);
    colours[2] = new PVector(255, 255, 0);
    colours[3] = new PVector(204, 255, 0);
    colours[4] = new PVector(255, 153, 0);
    colours[5] = new PVector(255, 102, 0);
    colours[6] = new PVector(255, 51, 0);
    colours[7] = new PVector(102, 0, 102);
    colours[8] = new PVector(102, 0, 0);
    colours[9] = new PVector(0, 0, 255);
    colours[10] = new PVector(102, 0, 0);
    colours[11] = new PVector(102, 0, 102);
    colours[12] = new PVector(255, 51, 0);
    colours[13] = new PVector(255, 102, 0);
    colours[14] = new PVector(255, 153, 0);
    colours[15] = new PVector(204, 255, 0);
    colours[16] = new PVector(255, 255, 0);
    colours[17] = new PVector(51, 255, 0);
    colours[18] = new PVector(51, 204, 255);
    
    origins[0] = new PVector(50, height);
    origins[1] = new PVector(100, height);
    origins[2] = new PVector(150, height);
    origins[3] = new PVector(200, height);
    origins[4] = new PVector(250, height);
    origins[5] = new PVector(300, height);
    origins[6] = new PVector(350, height);
    origins[7] = new PVector(400, height);
    origins[8] = new PVector(450, height);
    origins[9] = new PVector(500, height);
    origins[10] = new PVector(550, height);
    origins[11] = new PVector(600, height);
    origins[12] = new PVector(650, height);
    origins[13] = new PVector(700, height);
    origins[14] = new PVector(750, height);
    origins[15] = new PVector(800, height);
    origins[16] = new PVector(850, height);
    origins[17] = new PVector(900, height);
    origins[18] = new PVector(950, height);
    
    for (int i = 0 ; i < 19 ; i++)    // Creazione fontane
    {
      if (i == 9)
        life += 10;
      else
        life = 10;
      pSystems[i] = new ParticleSystem(origins[i], colours[i], life, count);
    }
  }
  
  public void run()      // Avvio fontane
  {
    pSystems[0].run(-fft.getAvg(9)*13);
    pSystems[1].run(-fft.getAvg(8)*13);
    pSystems[2].run(-fft.getAvg(7)*10);
    pSystems[3].run(-fft.getAvg(6)*10);
    pSystems[4].run(-fft.getAvg(5)*7);
    pSystems[5].run(-fft.getAvg(4)*7);
    pSystems[6].run(-fft.getAvg(3)*5);
    pSystems[7].run(-fft.getAvg(2)*5);
    pSystems[8].run(-fft.getAvg(1)*5);
    pSystems[9].run(-fft.getAvg(0)*2);
    pSystems[10].run(-fft.getAvg(1)*5);
    pSystems[11].run(-fft.getAvg(2)*5);
    pSystems[12].run(-fft.getAvg(3)*5);
    pSystems[13].run(-fft.getAvg(4)*7);
    pSystems[14].run(-fft.getAvg(5)*7);
    pSystems[15].run(-fft.getAvg(6)*10);
    pSystems[16].run(-fft.getAvg(7)*10);
    pSystems[17].run(-fft.getAvg(8)*13);
    pSystems[18].run(-fft.getAvg(9)*13);
  }
}

