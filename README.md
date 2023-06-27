# Weighted-TF
## Weighted Time-Frequency Representation
### A 3-components exponential chirp signal

### Windowed Signal 

Time-Frequency Representation Using Chirp Rate

```matlab
% [...]

function fun1
  % call helpFun1 here
end

function fun2
  % call helpFun2 here
end

function helpFun1
   % [...]
end

function helpFun2
   % [...]
end

% [...
Weigthed Short-Time Fourier Transform
A 3-components exponential chirp signal
clc,clear
load SignalsTypes
dt=Signals.ExpChip3C.dt;
s=Signals.ExpChip3C.s';
cr=Signals.ExpChip3C.cr;
N = length(s);
t = [0:N-1]*dt;
f = linspace(0,1/dt/2,N/2);
Windowed Signal 
S = repmat(s,1,N);
sd = 1./sqrt(2*pi*abs(cr))/dt;
W = WinMtx( N,sd );
figure;colormap gray
imagesc(S)
imagesc(W)
imagesc(W.*S)
Time-Frequency Representation Using Chirp Rate
TF = fft(W.*S);
TFR = abs(TF);
Weighted Time-Frequency representation
beta = .04;
wt = TFR.^ beta;
Wp = abs(ifft(wt .* TF) ./ (S + eps));
sw = sum(Wp,2);
Wp  = diag(1./sw) * Wp;
TFp = fft( Wp .* S );
TFRp = abs(TFp);
Figures
imagesc(t,f,TFR(fix(N/2)+1:end,:))
plot(cr);axis tight
imagesc(t,f,TFRp(fix(N/2)+1:end,:))
xlabel Time(s)
ylabel Frequency(Hz)
Inverse of The Transform
si = real(sum(ifft(TFp),2))';
plot(t,s,t,si)
sa=ifft(TF);
imagesc(unwrap(angle(sa),pi,1))
