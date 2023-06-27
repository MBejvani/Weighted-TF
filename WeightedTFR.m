clc,clear
load SignalsTypes
dt=Signals.ExpChip3C.dt;
s=Signals.ExpChip3C.s';
cr=Signals.ExpChip3C.cr;
N = length(s);
t = [0:N-1]*dt;
f = linspace(0,1/dt/2,N/2);
S = repmat(s,1,N);
sd = 1./sqrt(2*pi*abs(cr))/dt;
W = WinMtx( N,sd );
figure;colormap gray
imagesc(S)
imagesc(W)
imagesc(W.*S)

TF = fft(W.*S);
TFR = abs(TF);

beta = .04;
wt = TFR.^ beta;
Wp = abs(ifft(wt .* TF) ./ (S + eps));
sw = sum(Wp,2);
Wp  = diag(1./sw) * Wp;
TFp = fft( Wp .* S );
TFRp = abs(TFp);
figure;colormap gray
imagesc(t,f,TFR(fix(N/2)+1:end,:))
figure
plot(cr);axis tight
figure
imagesc(t,f,TFRp(fix(N/2)+1:end,:))
xlabel Time(s)
ylabel Frequency(Hz)
figure
si = real(sum(ifft(TFp),2))';
plot(t,s,t,si)
sa=ifft(TF);
figure;colormap gray
imagesc(unwrap(angle(sa),pi,1))