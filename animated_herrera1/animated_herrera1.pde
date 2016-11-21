 int WHITE = 255;
    int BLACK = 0;
    int fill_color = BLACK;
    float time = 0;
    float duration = 1000;
    float min = (float)0.5;
    float max = 50;
    float start = min;
    float change = max - min;
    float midway;
    PGraphics pg;


    public void setup() {
        size(1008, 500);
        midway = (float)width / 2;
        background(WHITE);
        noStroke();
        fill_color = BLACK;
        fill(fill_color);
        pg = createGraphics(width, height);
    }

    public void draw() {
        background(WHITE);
        float stripe_width =  easeInOut(time, start, change, duration);
        drawStripes(stripe_width);
        if (stripe_width > max) {
            time = 0;
            change *= -1;
            start = max;
        } else if (stripe_width < min) {
            time = 0;
            change *= -1;
            start = min;
        } else {
            time++;
        }

        pg.beginDraw();
        pg.background(255, 0);
        pg.noStroke();
        pg.fill(255);
        pg.ellipse(mouseX, mouseY, 200, 200);
        pg.endDraw();
        blend(pg, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
    }
    public void drawStripes(float stripe_width)
    {
        float x1 = midway;
        float x2 = midway - 2*stripe_width;
        while (x1 < width) {
            rect(x1, 0, stripe_width, height);
            rect(x2, 0, stripe_width, height);
            x1 += 2*stripe_width;
            x2 -= 2*stripe_width;
        }
    }
    public static float easeInOut (float t,float b , float c, float d) {
        if ((t/=d/2) < 1) return c/2*t*t*t + b;
        return c/2*((t-=2)*t*t + 2) + b;
    }