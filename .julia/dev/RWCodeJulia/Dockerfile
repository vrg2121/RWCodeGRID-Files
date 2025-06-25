FROM julia:1.10

RUN useradd --create-home --shell /bin/bash jl

ENV JULIA_DEPOT_PATH="/home/jl/.julia"
ENV JULIA_REVISE="off"

COPY . /home/jl/

RUN chown -R jl:jl /home/jl/Guesses && \
    chmod -R 755 /home/jl/Guesses && \
    mkdir /home/jl/Results

WORKDIR /home/jl/RWCode
USER jl

CMD ["julia", "--project", "./RWCode/src/RWCode.jl"]
