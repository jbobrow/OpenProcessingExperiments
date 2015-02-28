

public class CPool {
  int numPool = 1000, curGen = 0;
  double totalFitness;
  float crossrate = 0.7f, mutrate = 0.05f;
  // we need 5 genes in the chromosome. one each for centerX, centerY, width, height and angle of rotation
  int geneSize = 10, chlength = geneSize * 4;

  int numElite = 3, numEliteCopy = 1;

  PriorityQueue<Chromosome> pool;

  List<Rect> LC;
  int X0, Y0, X1, Y1;

  GeneticUtility gutil;


  CPool(float crossrate, float mutrate, int numpool, int genelength, List<Rect> lc, int x0, int y0, int x1, int y1) {
    this.crossrate = crossrate;
    this.mutrate = mutrate;
    this.geneSize = genelength;
    this.chlength = this.geneSize * 4;
    this.numPool = numpool;
    this.LC = lc;
    this.X0 = x0;
    this.Y0 = y0;
    this.X1 = x1;
    this.Y1 = y1;

    gutil = new GeneticUtility();

    pool = new PriorityQueue<Chromosome>();

    rePopulate();
  }


  void rePopulate() {
    pool.clear();
    this.curGen = 0;
    for (int i = 0; i < numPool;) {
      Chromosome ch = new Chromosome(chlength);
      gutil.randomize(ch.chromosome);
      calcFitness(ch);

      if (ch.fitness <= 0f)
        continue;

      pool.add(ch);
      i++;
    }
  }

	double calcFitness(Chromosome c) {
		int[] r = decode(c);
		Rect rr = new Rect(r);
		
		if (rr.width <= 0 || rr.height <= 0)
			return c.fitness = 0f;
		
		if (!rr.isWithin(X0, Y0, X1, Y1))
			return c.fitness = 0f;
		
		for (Rect ic : LC) {
			if (ic.isIntersecting(rr))
				return c.fitness = 0f;
		}
		
		return c.fitness = rr.width;
	}
	
	int[] decode(Chromosome c) {
		int[] ret = new int[4];
		for (int j = 0; j < 4; j++) {
			ret[j] = 0;
			for (int n = geneSize * j, ns = n + geneSize, i = n; i < ns; i++) {
				ret[j] |= (c.chromosome[i] & 1) << (i - n);
			}
		}
		
		// With a precision of 0.2, 360* = 1800. we can wrap the angle by 360*;
		if (ret[3] > 1800) {
			ret[3] = ret[3] - 1800;
		}
		return ret;
	}
	
	public Chromosome runStep() {
		List<Chromosome> P = new ArrayList<Chromosome>();
		
		this.totalFitness = 0.0;
		Iterator<Chromosome> itr = pool.iterator();
		int i = 0;
		while (itr.hasNext()) {
			Chromosome che = itr.next();
			totalFitness += che.fitness;
			if (i < numElite) {
				for (int j = 0; j < numEliteCopy; j++)
					P.add(new Chromosome(che));
			}
			i++;
		}
		
		for (int aai = 0, ns = pool.size(); aai < ns; aai += 2) {
			Chromosome a = rouletteSelect(), b = rouletteSelect();
			
			if (a.equals(b))
				continue;
			
			a.crossWith(b, gutil, crossrate, chlength);
			a.mutate(gutil, mutrate);
			b.mutate(gutil, mutrate);
			
			calcFitness(a);
			calcFitness(b);
			
			//			if (a.fitness > 0.0)
			P.add(a);
			//			if (b.fitness > 0.0)
			P.add(b);
		}
		
		this.pool.clear();
		this.pool.addAll(P);
		curGen++;
		
		return pool.peek();
	}
	
	public Chromosome rouletteSelect() {
		double targetTotal = this.totalFitness * gutil.chromRandom(), newTotal = 0.0;
		
		Chromosome cr = null;
		Iterator<Chromosome> itr = pool.iterator();
		while (itr.hasNext()) {
			cr = itr.next();
			newTotal += cr.fitness;
			if (newTotal >= targetTotal)
				break;
		}
		return new Chromosome(cr);
	}
}

