function [Gz]=NFS_C2D_matched(Gs,h, omegab)
    m=Gs.num.n; n=Gs.den.n; 
    if nargin==2; omegab=0; end %if omegab is not specified
    nr=n-m; % for the infinite zero substitution
    
    %converting finite poles and zeros
    for j=1:m
        znum(j)=exp(Gs.z(j)*h); %zeros
    end
    for j=1:n
        zden(j)=exp(Gs.p(j)*h); %poles
    end

    % converting one of the zeros to infinite
    if nr>0
        for j=m:n
            znum(j)=-1;
        end
        znum(find(znum==-1,1))=inf; %changing one of the z=-1 to infinity 
    end    
    K=RR_evaluate(Gs,1i*omegab); % find the gain at s=i*omega bar
    Gz=RR_tf(znum,zden,K); % put in together to one tf
    Gz.h=h; % so that it is not labeled as continuous time transfer function from rules of RR_tf
end
