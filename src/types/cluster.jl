####################################################
#
# Cluster is meant to hold 1 cluster as well as all
# info such as depth, fr and computed values such as MAD anc cv2.
#
####################################################


"""

    abstract type AbstractCluster{T} end

Parent type to concrete types representing single clusters.

"""
abstract type AbstractCluster{T} end



"""

    struct Cluster{T} <: AbstractCluster{T}
        id::Int64
        info::Dict{String,String}
        spiketimes::Vector{T}
    end

Struct for holding a single Cluster.

Direct field access is **not** recommended. Basic interface functions include:


"""
struct Cluster{T} <: AbstractCluster{T}
    id::Int64
    info::Dict{String,String}
    spiketimes::Vector{T}
end


"""

    function id(cluster::T) where {T<:AbstractCluster}

Returns the id of `cluster`
"""
@inline function id(cluster::T) where {T<:AbstractCluster}
    return cluster.id
end

"""

    nspikes(cluster::T) where {T<:AbstractCluster}

Returns the number of spikes (length of the `spiketimes` field) of `Cluster`.

"""
function nspikes(cluster::T) where {T<:AbstractCluster}
    return length(cluster.spiketimes)
end

"""

    info(cluster::T) where {T<:AbstractCluster}

Returns info (as dict) about `cluster`. A string may be supplied to return a specific entry (as Float64).
"""
@inline function info(cluster::T) where {T<:AbstractCluster}
    return cluster.info
end

@inline function info(cluster::T, var::String) where {T<:AbstractCluster}
    return cluster.info[var]
end


"""
    
    spiketimes(cluster::Cluster::T) where {T<:AbstractCluster}

Returns the spiketimes of `cluster`.

"""
@inline function spiketimes(cluster::T) where {T<:AbstractCluster}
    return cluster.spiketimes
end


"""
    struct RelativeCluster{T} <: AbstractCluster{T}
        id::Int64
        info::Dict{String,String}
        spiketimes::Vector{Vector{T}}
    end


Struct for holding a cluster and its spiketimes relative to triggers.       
Similar to `Cluster{T}` except that the field `spiketimes` is a `Vector{Vector{T}}` where each vector represents trigger #n.

Direct field access is **not** recommended. Basic interface functions include:

"""
struct RelativeCluster{T} <: AbstractCluster{T}
    id::Int64
    info::Dict{String,String}
    spiketimes::Vector{Vector{T}}
end
