
double Interpolate(double x, double y, double a)
{
    double val = (1 - cos((float)a * PI)) * .5;
    return x * (1 - val) + y * val;
}

double Noise(int x, int y)
{
    int n = x + y * 57;
    n = (n<<13) ^ n;

    return ( 1.0 - ( (int)(n * (n * n * r1 + r2) + r3) & 0x7fffffff) / 1073741824.0);
}

double Smooth(double x, double y)
{
    double n1 = Noise((int)x, (int)y);
    double n2 = Noise((int)x + 1, (int)y);
    double n3 = Noise((int)x, (int)y + 1);
    double n4 = Noise((int)x + 1, (int)y + 1);

    double i1 = Interpolate(n1, n2, x - (int)x);
    double i2 = Interpolate(n3, n4, x - (int)x);

    return Interpolate(i1, i2, y - (int)y);
}


float PerlinNoise2d(int x, int y)
{
    double total = 0.0;

		double cloud_frequency = global_cloud_frequency;    // USER ADJUSTABLE
		double cloud_persistence = global_cloud_persistence;   // USER ADJUSTABLE
		double cloud_octaves = global_cloud_octaves;         // USER ADJUSTABLE
		double cloud_amplitude = global_cloud_amplitude;       // USER ADJUSTABLE
		double cloud_coverage = global_cloud_coverage;   // USER ADJUSTABLE
		double cloud_density = global_cloud_density;    // USER ADJUSTABLE
		
		
		//println(global_cloud_frequency + "/" + cloud_frequency);


    for(int lcv = 0; lcv < cloud_octaves; lcv++)
    {
        total = total + Smooth(x * cloud_frequency, y * cloud_frequency) * cloud_amplitude;
        cloud_frequency = cloud_frequency * 2;
        cloud_amplitude = cloud_amplitude * cloud_persistence;
    }

    total = (total + cloud_coverage) * cloud_density;

    if(total < 0) total = 0.0;
    if(total > 1) total = 1.0;

    return (float)total;
}

