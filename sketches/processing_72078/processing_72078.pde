

static class Console
{
    public interface Application
    {
        public void   Process(String s);
        public String TabComplete(String s);
    }

    static private PApplet     Applet        = null;
    static private Application App           = null;
    static private int         MarginLeft    = 10;
    static private int         MarginRight   = 20;
    static private int         MarginTop     = 20;
    static private int         MarginBottom  = 20;
    static private int         FontSize      = 16;
    static private PFont       Font          = null;
    static private String      Prompt        = "> ";
    static private String      Carat         = "_";
    static private int         CaratPosition = -1;
    static private String      CurrentLine   = "";
    static private String      LastCommand   = "";
    static private ArrayList<String> Buffer  = new ArrayList<String>();
    
    static void Initialise(PApplet applet, Application app, PFont font, int font_size)
    {
        Applet   = applet;
        App      = app;
        Font     = font;
        FontSize = font_size;
    }
    
    static void Write(String s)
    {
        int max_line_width = Applet.width-MarginRight-MarginLeft;
        int max_char_width = (int) Applet.textWidth("W");

        StringBuffer line = new StringBuffer();
        
        for (int c=0 ; c<s.length() ; ++c)
        {
            line.append(s.charAt(c));
            if (Applet.textWidth(line.toString()) > (max_line_width-max_char_width) || s.charAt(c)=='\n')
            {
                Buffer.add(line.toString());
                line.setLength(0);
            }
        }

        if (line.length() > 0 || s.endsWith("\n"))
        {
            Buffer.add(line.toString());
        }
    }
    
    static void KeyPressed()
    {
        switch (Applet.keyCode)
        {
        case LEFT: --CaratPosition; return;
        case RIGHT: ++CaratPosition; return;
        case UP:
            CurrentLine   = LastCommand;
            CaratPosition = CurrentLine.length();
            return;
        case DOWN:
            //CurrentLine = "";
            return;
        }
        
        switch (Applet.key)
        {
        case TAB:
            {
                CurrentLine   = App.TabComplete(CurrentLine);
                CaratPosition = CurrentLine.length();
                return;
            }
        case DELETE:
            {
                String before_cursor = CurrentLine.substring(0, Math.max(CaratPosition, 0));
                String after_cursor  = CurrentLine.substring(Math.min(CaratPosition+1, CurrentLine.length()), CurrentLine.length());    
                CurrentLine = before_cursor + after_cursor;
                break;
            }
        case BACKSPACE:
            {
                String before_cursor = CurrentLine.substring(0, Math.max(CaratPosition-1, 0));
                String after_cursor  = CurrentLine.substring(Math.min(CaratPosition, CurrentLine.length()), CurrentLine.length());    
                CurrentLine = before_cursor + after_cursor;
                --CaratPosition;
                break;
            }
        case ENTER:
        case RETURN:
            Write(Prompt+CurrentLine);
            LastCommand = CurrentLine;
            if (App != null)
            {
                App.Process(CurrentLine);
            }
            CurrentLine = "";
            CaratPosition = -1;
            break;
        default:
            String before_cursor = CurrentLine.substring(0, Math.max(CaratPosition, 0));
            String after_cursor  = CurrentLine.substring(Math.min(CaratPosition, CurrentLine.length()), CurrentLine.length());
            CurrentLine = before_cursor + Applet.key + after_cursor;
            ++CaratPosition;
            break;
        }
    }
    
    static void Draw()
    {
        if (Applet==null || Font==null)
        {
            return;
        }
        
        CaratPosition = Math.max(CaratPosition, 0);
        CaratPosition = Math.min(CaratPosition, CurrentLine.length());
        
        Applet.textFont(Font, FontSize);
        
        int x = MarginLeft;
        int y = MarginTop;
        int x_min = MarginLeft;
        int x_max = Applet.width-MarginRight;
        
        // Draw buffer:
        int max_lines = (Applet.height-MarginTop-MarginBottom) / FontSize;
        int lines_to_draw = Math.min(max_lines, Buffer.size());
        for (int i=Buffer.size()-lines_to_draw ; i<Buffer.size() ; ++i)
        {
            Applet.text(Buffer.get(i), x, y);
            y += FontSize;
        }
        
        // Draw current line:
        int right_aligned = Applet.width-MarginRight-(int)Applet.textWidth(Prompt+CurrentLine+Carat);
        x = min(MarginLeft, right_aligned);
        
        int carat_line_pos = CaratPosition + Prompt.length();
        boolean show_carat = (Applet.millis() % 1000) < 500;
        String prompt_and_line = Prompt + CurrentLine;

        for (int index=0 ; index<prompt_and_line.length() ; ++index)
        {
            char c = prompt_and_line.charAt(index);
            int c_width = (int) Applet.textWidth(c);
            if (x>=x_min && (x+c_width)<=x_max)
            {
                Applet.text(c, x, y);
                if (show_carat && index==carat_line_pos)
                {
                    Applet.text(Carat, x, y);
                }
            }
            x += c_width;
        }

        if (show_carat && carat_line_pos == prompt_and_line.length())
        {
            Applet.text(Carat, x, y);
        }
    }
}


