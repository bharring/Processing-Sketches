 int WHITE = 255;
    int BLACK = 0;
    Stripes stripes;
    Ball ball;
    
    public void setup() {
      size(1066, 800);
        background(WHITE);
        noStroke();
        ball = new Ball();
        stripes = new Stripes();
    }
     
    public void draw() {
        stripes.move();
        ball.move();
    }
    public class Ball {
        float x, y, x_change, y_change, time, duration;
        PGraphics pg;
        public Ball() {
            time = 0;
            duration = 200;
            x = 100;
            x_change = random(0, width - 200);
            y = 100;
            y_change = height - 200;
            pg = createGraphics(width, height);
        }
        public void move(){
            pg.beginDraw();
            pg.background(255, 0);
            pg.noStroke();
            pg.fill(255);
            pg.ellipse(easeInOut(time, x, x_change, duration), easeInOut(time, y, y_change, duration), 200, 200);
            pg.endDraw();
            blend(pg, 0, 0, width, height, 0, 0, width, height, DIFFERENCE);
            if (time >= duration) {
                x += x_change;
                x_change = random(100, width - 100) - x;
                y += y_change;
                y_change = - y_change;
                time = 0;
            } else {
                time++;
            }
        }
        public float  easeInOut(float t,float b , float c, float d) {
            if (t==0) return b;  if ((t/=d/2)==2) return b+c;
            float p=d*(.3f*1.5f);
            float a=c;
            float s=p/4;
            if (t < 1) return -.5f*(a*(float)Math.pow(2,10*(t-=1)) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p )) + b;
            return a*(float)Math.pow(2,-10*(t-=1)) * (float)Math.sin( (t*d-s)*(2*(float)Math.PI)/p )*.5f + c + b;
        }
    }
    public class Stripes {
        float time, duration, min, max, start, change, midway;
        public Stripes()
        {
            time = 0;
            duration = 1000;
            min = 2;
            max = 533;
            start = min;
            change = max - min;
            midway = (float)width / 2;
        }
        public void move()
        {
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
        }
        public void drawStripes(float stripe_width)
        {
            fill(BLACK);
            float x1 = midway;
            float x2 = midway - 2*stripe_width;
            while (x1 < width) {
                rect(x1, 0, stripe_width, height);
                rect(x2, 0, stripe_width, height);
                x1 += 2*stripe_width;
                x2 -= 2*stripe_width;
            }
        }
        public float easeInOut (float t,float b , float c, float d) {
            if ((t/=d/2) < 1) return c/2*t*t*t + b;
            return c/2*((t-=2)*t*t + 2) + b;
        }
    }