
import java.util.concurrent.*;
DrawThread[] drawThreads = new DrawThread[partitions];

class DrawThread extends Thread {
  int myPartition;

  DrawThread(int partition) { 
    myPartition = partition;
  }

  public void run() {
    // draw particles
    for (int i = myPartition*physics.particles.size()/partitions;
         i < (myPartition + 1)*physics.particles.size()/partitions; ++i) {
        Particle p = (Particle)physics.particles.get(i);
      p.draw();
      println("Drawing " + i);
    }
  }
}

void drawParticles() {
  for (VerletParticle2D vp : physics.particles) {
    Particle p = (Particle)vp;
    p.draw();
  }
}

class DrawPool extends Thread {
  ExecutorService threadPool;

  DrawPool(int partitions) {
    threadPool = Executors.newFixedThreadPool(partitions);
  }

  void run() {
    for (int i = 0; i < partitions; ++i) {
      threadPool.execute(new DrawThread(i));
    }
  }
}


