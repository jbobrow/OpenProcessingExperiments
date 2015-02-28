

import java.io.File;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.StringTokenizer;
import java.util.Vector;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CSVloader
{
    private double theRate;
    private String theFips;
    private Vector values = new Vector();
    private dataGather dg;
    private String currentPeriod = "M0";

    public CSVloader(double r, String f)
    {
        this.theRate = r;
        this.theFips = f;
    }

    public CSVloader(String fName)
    {

        try
        {
            File file = new File(fName);

            BufferedReader bufRdr = new BufferedReader(new FileReader(file));

            String line = null;
            String full_fips = "";
            double rate = 0;

            while((line = bufRdr.readLine()) != null)
            {
                StringTokenizer st = new StringTokenizer(line,",");
                String s = "";
                int col = 0;

                while(st.hasMoreTokens())
                {
                    s = st.nextToken();

                    if (!(s.startsWith("\"")))
                    {
                        if (col == 1 || col == 2)
                        {
                            full_fips = full_fips + s;
                        }
                        if (col == 8)
                        {
                            String r = "";
                            String g = "0123456789";
                            for (int j = 0; j < s.length(); j++)
                            {
                                if (g.indexOf(s.charAt(j)) >= 0)
                                    r += s.charAt(j);
                            }
                            rate = Double.parseDouble(r)/10;
                        }
                        col++;
                    }
                }

                values.add(new CSVloader(rate,full_fips));
                rate = 0;
                full_fips = "";
            }
            bufRdr.close();
        }
        catch(Exception e)
        {
            System.err.println("It failed!");
            System.err.println(e.toString());
        }
    }

    public CSVloader(int year, String period)
    {
          if (currentPeriod != period)
          {
            dg = new dataGather(year+period+"unemp.xml");
            currentPeriod = period;
          }
        
          this.values = dg.getData(period);
    }

    public Vector getValues()
    {
        return values;
    }

    public double getRate()
    {
        return this.theRate;
    }

    public String getFips()
    {
        return this.theFips;
    }
}

